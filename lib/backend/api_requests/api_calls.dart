import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

// 获取人物列表
class FiguresApiCall {
  static Future<ApiCallResponse> search(int page, int pageSize,
      {String type, String sort, String text}) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl:
          'http://192.168.1.40:1337/api/figures?pagination[page]=$page&pagination[pageSize]=$pageSize&sort=$type:$sort&filters[\$or][0][name][\$contains]=$text&filters[\$or][1][from][\$contains]=$text',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static Future<ApiCallResponse> getAllCall() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl: 'http://192.168.1.40:1337/api/figures?populate=cover',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static Future<ApiCallResponse> getTopChartsCall() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl: 'http://192.168.1.40:1337/api/figures/topCharts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static Future<ApiCallResponse> getOne(int id) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl: 'http://192.168.1.40:1337/api/figures/' + id.toString(),
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic list(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class AuthApiCall {
  // 注册账号
  static Future<ApiCallResponse> registerCall(
      String username, String email, String password, String code) {
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterApi',
      apiUrl: 'http://192.168.1.40:1337/api/auth/local/register',
      callType: ApiCallType.POST,
      headers: {},
      bodyType: BodyType.JSON,
      params: {
        "username": username,
        "email": email,
        "password": password,
        "code": code,
      },
      returnBody: true,
    );
  }

  // 发送邮件
  static Future<ApiCallResponse> confirmEmail(String email) {
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterApi',
      apiUrl: 'http://192.168.1.40:1337/api/auth/send-email-confirmation',
      callType: ApiCallType.POST,
      headers: {},
      bodyType: BodyType.JSON,
      params: {
        "email": email,
      },
      returnBody: true,
    );
  }

  // 登录
  static Future<ApiCallResponse> loginApiCall(String email, String password) {
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'http://192.168.1.40:1337/api/auth/local',
      callType: ApiCallType.POST,
      headers: {},
      bodyType: BodyType.JSON,
      params: {
        "identifier": email,
        "password": password,
      },
      returnBody: true,
    );
  }

  // 微信登录
  static Future<ApiCallResponse> wechatLoginApiCall(
      String email, String password) {
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'http://192.168.1.40:1337/api/auth/wechat',
      callType: ApiCallType.POST,
      headers: {},
      bodyType: BodyType.JSON,
      params: {
        "identifier": '111',
        "password": '2222',
      },
      returnBody: true,
    );
  }
}
