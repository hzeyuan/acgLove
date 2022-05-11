import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
    _userInfo = prefs.getBool('ff_userInfo') ?? _userInfo;
    _jwtToken = prefs.getString('ff_jwtToken') ?? _jwtToken;
  }

  SharedPreferences prefs;

  // 用户信息
  String _userInfo = json.encode({
    'userId': '',
    'userName': '',
    'userAvatar': '',
    'userEmail': '',
    'userPhone': '',
    'userGender': '',
    'userBirthday': '',
    'userAddress': '',
    'userLat': '',
    'userLng': '',
    'userToken': '',
  });
  String get userInfo => _userInfo;
  set userInfo(String _value) {
    _userInfo = _value;
    prefs.setString('ff_userInfo', _value);
  }

  // 是否登录
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool _value) {
    _isLogin = _value;
    prefs.setBool('ff_isLogin', _value);
  }

  // jwt Token
  String _jwtToken = '';
  String get jwtToken => _jwtToken;
  set jwtToken(String _value) {
    _jwtToken = _value;
    prefs.setString('ff_jwtToken', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
