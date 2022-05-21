import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
    print('1231');
    var res = ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl: 'http://192.168.1.40:1337/api/figures/topCharts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      cache: true,
      returnBody: true,
    );
    print('结果');

    return res;
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
      cache: false,
    );
  }

  // 微信登录
  static Future<ApiCallResponse> wechatLoginApiCall(
      String token, String openId) {
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'http://192.168.1.40:1337/api/auth/wechat/callback',
      callType: ApiCallType.GET,
      headers: {},
      bodyType: BodyType.JSON,
      params: {
        "access_token": token,
        "openId": openId,
      },
      returnBody: true,
      cache: false,
    );
  }
}

//
class TraceMoeApiCall {
  static Future<String> searchCall(String url, XFile file) async {
    return await ApiManager.instance.asyncFileUpload(url: url, file: file);
  }

  static Future<ApiCallResponse> anilistApiCall(List<int> ids) {
    return ApiManager.instance.makeApiCall(
      callName: 'anilistApi',
      apiUrl: 'https://trace.moe/anilist/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=gbk',
      },
      bodyType: BodyType.JSON,
      params: {
        "query": """
query (\$ids: [Int]) {
            Page(page: 1, perPage: 50) {
              media(id_in: \$ids, type: ANIME) {
                id
                title {
                  native
                  romaji
                  english
                }
                type
                format
                status
                startDate {
                  year
                  month
                  day
                }
                endDate {
                  year
                  month
                  day
                }
                season
                episodes
                duration
                source
                coverImage {
                  large
                  medium
                }
                bannerImage
                genres
                synonyms
                studios {
                  edges {
                    isMain
                    node {
                      id
                      name
                      siteUrl
                    }
                  }
                }
                isAdult
                externalLinks {
                  id
                  url
                  site
                }
                siteUrl
              }
            }
          }
          
""",
        "variables": {"ids": ids}
      },
      returnBody: true,
      cache: false,
    );
  }

  static media(dynamic response) => getJsonField(
        response,
        r'''$.data.Page.media''',
      );
}

class AnimeApiCall {
  static Future<ApiCallResponse> faceCartoonPic(String imageBase64) {
    print('请求');
    return ApiManager.instance.makeApiCall(
      callName: 'GetFiguresApi',
      apiUrl: 'http://192.168.1.40:1337/api/figures/FaceCartoonPic',
      callType: ApiCallType.POST,
      bodyType: BodyType.JSON,
      headers: {},
      params: {
        'image': imageBase64,
      },
      returnBody: true,
    );
  }
}
