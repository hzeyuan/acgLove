import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_path/json_path.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

import 'lat_lng.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

export 'lat_lng.dart';
export 'place.dart';
export '../app_state.dart';
export 'dart:math' show min, max;
export 'package:intl/intl.dart';
export 'package:page_transition/page_transition.dart';

T valueOrDefault<T>(T value, T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;

String dateTimeFormat(String format, DateTime dateTime) {
  if (dateTime == null) {
    return '';
  }
  if (format == 'relative') {
    return timeago.format(dateTime);
  }
  return DateFormat(format).format(dateTime);
}

Future launchURL(String url) async {
  var uri = Uri.parse(url).toString();
  try {
    await launch(uri);
  } catch (e) {
    throw 'Could not launch $uri: $e';
  }
}

enum FormatType {
  decimal,
  percent,
  scientific,
  compact,
  compactLong,
  custom,
}

enum DecimalType {
  automatic,
  periodDecimal,
  commaDecimal,
}

String formatNumber(
  num value, {
  FormatType formatType,
  DecimalType decimalType,
  String currency,
  bool toLowerCase = false,
  String format,
  String locale,
}) {
  var formattedValue = '';
  switch (formatType) {
    case FormatType.decimal:
      switch (decimalType) {
        case DecimalType.automatic:
          formattedValue = NumberFormat.decimalPattern().format(value);
          break;
        case DecimalType.periodDecimal:
          formattedValue = NumberFormat.decimalPattern('en_US').format(value);
          break;
        case DecimalType.commaDecimal:
          formattedValue = NumberFormat.decimalPattern('es_PA').format(value);
          break;
      }
      break;
    case FormatType.percent:
      formattedValue = NumberFormat.percentPattern().format(value);
      break;
    case FormatType.scientific:
      formattedValue = NumberFormat.scientificPattern().format(value);
      if (toLowerCase) {
        formattedValue = formattedValue.toLowerCase();
      }
      break;
    case FormatType.compact:
      formattedValue = NumberFormat.compact().format(value);
      break;
    case FormatType.compactLong:
      formattedValue = NumberFormat.compactLong().format(value);
      break;
    case FormatType.custom:
      final hasLocale = locale != null && locale.isNotEmpty;
      formattedValue =
          NumberFormat(format, hasLocale ? locale : null).format(value);
  }

  if (formattedValue.isEmpty) {
    return value.toString();
  }

  if (currency != null) {
    final currencySymbol = currency.isNotEmpty
        ? currency
        : NumberFormat.simpleCurrency().format(0.0).substring(0, 1);
    formattedValue = '$currencySymbol$formattedValue';
  }

  return formattedValue;
}

DateTime get getCurrentTimestamp => DateTime.now();

extension DateTimeComparisonOperators on DateTime {
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <=(DateTime other) => this < other || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => this > other || isAtSameMomentAs(other);
}

dynamic getJsonField(dynamic response, String jsonPath) {
  final field = JsonPath(jsonPath).read(response);
  return field.isNotEmpty
      ? field.length > 1
          ? field.map((f) => f.value).toList()
          : field.first.value
      : null;
}

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isiOS => !kIsWeb && Platform.isIOS;
bool get isWeb => kIsWeb;
bool responsiveVisibility({
  @required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
  bool desktop = true,
}) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return phone;
  } else if (width < 767) {
    return tablet;
  } else if (width < 991) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

void setAppLanguage(BuildContext context, String language) =>
    MyApp.of(context).setLocale(Locale(language, ''));

void setDarkModeSetting(BuildContext context, ThemeMode themeMode) =>
    MyApp.of(context).setThemeMode(themeMode);

void showSnackbar(
  BuildContext context,
  String message, {
  bool loading = false,
  int duration = 4,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (loading)
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10.0),
              child: Container(
                height: 20,
                width: 20,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          Text(message),
        ],
      ),
      duration: Duration(seconds: duration),
    ),
  );
}

extension FFStringExt on String {
  String maybeHandleOverflow({int maxChars, String replacement = ''}) =>
      maxChars != null && length > maxChars
          ? replaceRange(maxChars, null, replacement)
          : this;
}

saveFile(String imageUrl, {bool isBase64: false}) async {
  // var appDocDir = await getTemporaryDirectory();

  Uint8List imageBytes;
  if (isBase64 == true) {
    /// 保存资源图片
    imageBytes = base64.decode(imageUrl);
    // imageBytes = bytes.buffer.asUint8List();
  } else {
    /// 保存网络图片
    CachedNetworkImage image = CachedNetworkImage(imageUrl: imageUrl);
    DefaultCacheManager manager = image.cacheManager ?? DefaultCacheManager();
    Map<String, String> headers = image.httpHeaders;
    File file = await manager.getSingleFile(
      image.imageUrl,
      headers: headers,
    );
    imageBytes = await file.readAsBytes();
  }

  /// 保存图片
  final result = await ImageGallerySaver.saveImage(imageBytes);

  if (result == null || result == '') throw '图片保存失败';

  print("保存成功");
}
