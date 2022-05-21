import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HZYCachedNetWorkImageWidget extends CachedNetworkImage {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  HZYCachedNetWorkImageWidget({
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        width: 75,
        height: 50,
        child: SpinKitThreeBounce(
          color: FlutterFlowTheme.of(context).primaryColor,
          size: 50,
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
