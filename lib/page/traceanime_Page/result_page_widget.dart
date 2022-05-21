import 'dart:convert';
import 'dart:io';

import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_icon_button.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/flutter_flow/flutter_flow_video_player.dart';
import 'package:acg_love/widget/hzy_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class TraceAnimeWidget extends StatefulWidget {
  const TraceAnimeWidget({Key key}) : super(key: key);

  @override
  _TraceAnimeWidgetState createState() => _TraceAnimeWidgetState();
}

class _TraceAnimeWidgetState extends State<TraceAnimeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  bool _loading = false;
  XFile _image;
  int _index = 0;

  dynamic anilistList = [
    {
      "id": 10079,
      "title": {
        "native": "星空へ架かる橋",
        "romaji": "Hoshizora e Kakaru Hashi",
        "english": "A Bridge to the Starry Skies",
        "chinese": "架向星空之橋"
      },
      "type": "ANIME",
      "format": "TV",
      "status": "FINISHED",
      "startDate": {"year": 2011, "month": 4, "day": 11},
      "endDate": {"year": 2011, "month": 6, "day": 27},
      "season": "SPRING",
      "episodes": 12,
      "duration": 25,
      "source": "VISUAL_NOVEL",
      "coverImage": {
        "large":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx10079-NhSIefVJjprE.jpg",
        "medium":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx10079-NhSIefVJjprE.jpg"
      },
      "bannerImage":
          "https://anilist.co/anime/21034/Is-the-Order-a-Rabbit-Season-2/",
      "genres": ["Ecchi", "Romance"],
      "synonyms": [],
      "studios": {
        "edges": [
          {
            "isMain": false,
            "node": {
              "id": 53,
              "name": "Dentsu",
              "siteUrl": "https://anilist.co/studio/53"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 82,
              "name": "Marvelous Entertainment",
              "siteUrl": "https://anilist.co/studio/82"
            }
          },
          {
            "isMain": true,
            "node": {
              "id": 95,
              "name": "Doga Kobo",
              "siteUrl": "https://anilist.co/studio/95"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 144,
              "name": "Pony Canyon",
              "siteUrl": "https://anilist.co/studio/144"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 699,
              "name": "feng",
              "siteUrl": "https://anilist.co/studio/699"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 753,
              "name": "PRA",
              "siteUrl": "https://anilist.co/studio/753"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 755,
              "name": "Jumondou",
              "siteUrl": "https://anilist.co/studio/755"
            }
          }
        ]
      },
      "isAdult": false,
      "externalLinks": [
        {
          "id": 53,
          "url":
              "http://www.crunchyroll.com/a-bridge-to-the-starry-skies-hoshizora-e-kakaru-hashi",
          "site": "Crunchyroll"
        },
        {
          "id": 31887,
          "url":
              "https://vrv.co/series/GRX0JQ4K6/A-Bridge-to-the-Starry-Skies-Hoshizora-e-Kakaru-Hashi",
          "site": "VRV"
        }
      ],
      "siteUrl": "https://anilist.co/anime/10079"
    },
    {
      "id": 21034,
      "title": {
        "native": "ご注文はうさぎですか？？",
        "romaji": "Gochuumon wa Usagi desu ka??",
        "english": "Is the Order a Rabbit?? Season 2",
        "chinese": "請問您今天要來點兔子嗎？？"
      },
      "type": "ANIME",
      "format": "TV",
      "status": "FINISHED",
      "startDate": {"year": 2015, "month": 10, "day": 10},
      "endDate": {"year": 2015, "month": 12, "day": 26},
      "season": "FALL",
      "episodes": 12,
      "duration": 23,
      "source": "MANGA",
      "coverImage": {
        "large":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx21034-PgPlR55DktTJ.jpg",
        "medium":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx21034-PgPlR55DktTJ.jpg"
      },
      "bannerImage":
          "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx21034-PgPlR55DktTJ.jpg",
      "genres": ["Comedy", "Slice of Life"],
      "synonyms": ["Gochiusa"],
      "studios": {
        "edges": [
          {
            "isMain": true,
            "node": {
              "id": 314,
              "name": "White Fox",
              "siteUrl": "https://anilist.co/studio/314"
            }
          },
          {
            "isMain": true,
            "node": {
              "id": 290,
              "name": "Kinema Citrus",
              "siteUrl": "https://anilist.co/studio/290"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 31,
              "name": "NBCUniversal Entertainment Japan",
              "siteUrl": "https://anilist.co/studio/31"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 797,
              "name": "Houbunsha",
              "siteUrl": "https://anilist.co/studio/797"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 61,
              "name": "Frontier Works",
              "siteUrl": "https://anilist.co/studio/61"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 775,
              "name": "Bushiroad",
              "siteUrl": "https://anilist.co/studio/775"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 777,
              "name": "Hakuhodo DY Music & Pictures",
              "siteUrl": "https://anilist.co/studio/777"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 238,
              "name": "AT-X",
              "siteUrl": "https://anilist.co/studio/238"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 837,
              "name": "I0plus",
              "siteUrl": "https://anilist.co/studio/837"
            }
          },
          {
            "isMain": false,
            "node": {
              "id": 969,
              "name": "Ray",
              "siteUrl": "https://anilist.co/studio/969"
            }
          }
        ]
      },
      "isAdult": false,
      "externalLinks": [
        {"id": 889, "url": "http://www.gochiusa.com/", "site": "Official Site"},
        {
          "id": 2259,
          "url": "http://www.crunchyroll.com/is-the-order-a-rabbit",
          "site": "Crunchyroll"
        },
        {
          "id": 2919,
          "url": "https://twitter.com/usagi_anime",
          "site": "Twitter"
        },
        {
          "id": 5931,
          "url": "https://www.hidive.com/tv/is-the-order-a-rabbit-season-2",
          "site": "HIDIVE"
        },
        {
          "id": 17215,
          "url":
              "https://www.youtube.com/playlist?list=PLwLSw1_eDZl0smcI8BvC5vX6LEwhwgwF6",
          "site": "YouTube"
        },
        {
          "id": 21635,
          "url": "https://vrv.co/series/GR2P1P2KR/Is-the-Order-a-Rabbit",
          "site": "VRV"
        }
      ],
      "siteUrl": "https://anilist.co/anime/21034"
    }
  ];
  dynamic _result = [
    {
      "anilist": 21034,
      "filename":
          "[Leopard-Raws] Gochuumon wa Usagi Desu ka 2nd - 01 RAW (KBS 1280x720 x264 AAC).mp4",
      "episode": 1,
      "from": 288.58,
      "to": 292.67,
      "similarity": 0.99,
      "video":
          "https://media.trace.moe/video/21034/%5BLeopard-Raws%5D%20Gochuumon%20wa%20Usagi%20Desu%20ka%202nd%20-%2001%20RAW%20(KBS%201280x720%20x264%20AAC).mp4?t=290.625&token=AnrHqEaHe5nW7Ce9BXiEUWUmLPA",
      "image":
          "https://media.trace.moe/image/21034/%5BLeopard-Raws%5D%20Gochuumon%20wa%20Usagi%20Desu%20ka%202nd%20-%2001%20RAW%20(KBS%201280x720%20x264%20AAC).mp4.jpg?t=290.625&token=wXpkqrd6vYGePpIeI0DjGG75eo"
    },
    {
      "anilist": 21034,
      "filename":
          "[Ohys-Raws] Gochuumon wa Usagi Desuka 2 - 01 (AT-X 1280x720 x264 AAC).mp4",
      "episode": 1,
      "from": 288.75,
      "to": 292.75,
      "similarity": 0.9735424868893542,
      "video":
          "https://media.trace.moe/video/21034/%5BOhys-Raws%5D%20Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(AT-X%201280x720%20x264%20AAC).mp4?t=290.75&token=SwRuMoGPfMMQhYGr7JxNPBHtTg",
      "image":
          "https://media.trace.moe/image/21034/%5BOhys-Raws%5D%20Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(AT-X%201280x720%20x264%20AAC).mp4.jpg?t=290.75&token=vqmG1sktUC8n9M6s2nexw2HY"
    },
    {
      "anilist": 21034,
      "filename": "Gochuumon wa Usagi Desuka 2 - 01 (BD 1280x720 x264 AAC).mp4",
      "episode": 1,
      "from": 278.5,
      "to": 282.67,
      "similarity": 0.9735424868893542,
      "video":
          "https://media.trace.moe/video/21034/Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(BD%201280x720%20x264%20AAC).mp4?t=280.58500000000004&token=eL0RGs87vonuBZFI5rvRc03N4",
      "image":
          "https://media.trace.moe/image/21034/Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(BD%201280x720%20x264%20AAC).mp4.jpg?t=280.58500000000004&token=sf4huTXASQEjPu35VJh8d5y9XY"
    },
    {
      "anilist": 21034,
      "filename":
          "Gochuumon wa Usagi Desuka 2 - 01 (BS11 1280x720 x264 AAC).mp4",
      "episode": 1,
      "from": 289.08,
      "to": 292.75,
      "similarity": 0.9735424868893542,
      "video":
          "https://media.trace.moe/video/21034/Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(BS11%201280x720%20x264%20AAC).mp4?t=290.91499999999996&token=5T4B1E5nt4DZRs1jPBDFbdUykoM",
      "image":
          "https://media.trace.moe/image/21034/Gochuumon%20wa%20Usagi%20Desuka%202%20-%2001%20(BS11%201280x720%20x264%20AAC).mp4.jpg?t=290.91499999999996&token=rRXZk8QiU7f4zrI46fC7oQVJ4M"
    },
    {
      "anilist": 10079,
      "filename":
          "[SumiSora][Hoshizora e Kakaru Hashi][BDrip][04][BIG5][720P].mp4",
      "episode": 4,
      "from": 1295.58,
      "to": 1299.08,
      "similarity": 0.8265179965813713,
      "video":
          "https://media.trace.moe/video/10079/%5BSumiSora%5D%5BHoshizora%20e%20Kakaru%20Hashi%5D%5BBDrip%5D%5B04%5D%5BBIG5%5D%5B720P%5D.mp4?t=1297.33&token=upEhm6i8BeonuQANavYRdQS7Q",
      "image":
          "https://media.trace.moe/image/10079/%5BSumiSora%5D%5BHoshizora%20e%20Kakaru%20Hashi%5D%5BBDrip%5D%5B04%5D%5BBIG5%5D%5B720P%5D.mp4.jpg?t=1297.33&token=qYp5Xo9HhIR1IlpP3gkuyTNXUY"
    },
  ];
  var currentInfo;
  // 获取选中的动漫：动漫信息

  _getAnilistInfo() {
    int id = _result[_index]['anilist'];
    for (var i = 0; i < anilistList.length; i++) {
      if (anilistList[i]['id'] == id) {
        return anilistList[i];
      }
    }
    return {};
  }

  @override
  void initState() {
    super.initState();
    currentInfo = _getAnilistInfo();
  }

  // todo:封装
  Future getImage(String type) async {
    XFile image;
    if (type == 'camera') {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery); // 相册
    }
    setState(() {
      _loading = true;
    });
    String res =
        await TraceMoeApiCall.searchCall('https://api.trace.moe/search', image);
    Map<String, dynamic> data = json.decode(res);

    List<dynamic> result = data['result'];
    List<int> ids = [];
    result.forEach((e) {
      ids.add(e['anilist']);
    });

    ApiCallResponse rsp =
        await TraceMoeApiCall.anilistApiCall(ids.toSet().toList());
    setState(() {
      _loading = false;
      _image = image;

      _result = result;
      anilistList = TraceMoeApiCall.media(rsp?.jsonBody);
      currentInfo = _getAnilistInfo();
    });
  }

  _getCurrentAnime(anilistId) {
    for (var i = 0; i < anilistList.length; i++) {
      if (anilistList[i]['id'] == anilistId) {
        return anilistList[i];
      }
    }
    return {};
  }

  //时间转换 将秒转换为小时分钟
  String _durationTransform<T>(T seconds) {
    var d = Duration(seconds: seconds is double ? seconds.toInt() : seconds);

    List<String> parts = d.toString().split(':');
    if (parts.first == '0') {
      parts.first = '00';
    }
    parts.last = double.parse(parts.last).toInt().toString();
    return parts.join(':');
  }

  // 渲染别名
  renderSynonyms() {
    List<Text> list = []; //别名列表

    currentInfo['title'].forEach((String key, dynamic value) {
      if (value.toString() != 'null') {
        list.add(Text(
          value,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
        ));
      }
    });

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '别名：',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: list,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  //渲染搜索结果
  renderFindResult() {
    List<Padding> list = []; //别名列表
    _result.forEach((element) {
      // if (element['similarity'] < 0.9) return;

      var currentAnime = _getCurrentAnime(element['anilist']);
      // 成人向的不显示
      if (currentAnime['isAdult'] == true) return;

      list.add(
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: Row(
                key: UniqueKey(),
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowVideoPlayer(
                          path: element['video'] + '&mute',
                          videoType: VideoType.network,
                          autoPlay: true,
                          looping: true,
                          showControls: true,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                        Text(
                          '名称：${currentAnime['title']['native'] ?? ''}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '时间：${_durationTransform(element["from"])} - ${_durationTransform(element["to"])}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '成人向：${currentAnime["isAdult"] ? "是" : "否"}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '相似度：${element['similarity'].toStringAsFixed(5)}',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                child: Text(
                  '搜索结果',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                      ),
                ),
              ),
              ...list
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '演示demo',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.question,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 20,
            ),
            onPressed: () {
              EasyLoading.showToast('提示：通过照片来查询动漫的来源');
            },
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_loading) {
            EasyLoading.showToast('正在努力工作中~',
                toastPosition: EasyLoadingToastPosition.bottom);
            return;
          }
          _showBottomSheet();
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.cloud_upload,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 24,
        ),
      ),
      body: Stack(alignment: AlignmentDirectional.center, children: [
        GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.245,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () async {},
                          child: HZYCachedNetWorkImageWidget(
                            imageUrl: currentInfo['bannerImage'] ??
                                currentInfo['coverImage']['large'],
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: HZYCachedNetWorkImageWidget(
                                  imageUrl: currentInfo['coverImage']['large'],
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                        Align(
                            alignment: AlignmentDirectional(0.85, 0.95),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width -
                                    16 * 2 -
                                    100,
                              ),
                              child: Text(
                                currentInfo['title']['native'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  renderSynonyms(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                        child: Text(
                          '上传截图',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: _image != null
                        // 上传的图片
                        ? Image.file(
                            File(_image.path),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            fit: BoxFit.contain,
                          )
                        :
                        // 默认图片
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/rabbit.jpeg',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x2D000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                  ),
                  renderFindResult(),
                ],
              ),
            )),
        _loading
            ? Container(
                color: Colors.black12,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              )
            : Container(width: 0, height: 0)
      ]),
    );
  }

  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    child: InkWell(
                  onTap: () {
                    // getImage('camera');
                    // Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      "拍摄",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                    child: InkWell(
                  onTap: () {
                    getImage('gallery');
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      "选择一张照片",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                  color: FlutterFlowTheme.of(context).lineColor,
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    '取消',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
