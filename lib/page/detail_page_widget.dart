import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailPageWidget extends StatefulWidget {
  const DetailPageWidget({Key key, this.id}) : super(key: key);

  final int id;
  @override
  _DetailPageWidgetState createState() => _DetailPageWidgetState();
}

class _DetailPageWidgetState extends State<DetailPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // 头部导航条
    Align Function(Map<String, dynamic>) renderAppbar = (figure) {
      return Align(
        alignment: AlignmentDirectional(0, -0.87),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x520E151B),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8,
                  borderWidth: 1,
                  buttonSize: 40,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x520E151B),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8,
                  borderWidth: 1,
                  buttonSize: 40,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.ios_share,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20,
                  ),
                  onPressed: () async {
                    // await Share.share(figure['name']);
                    SSDKMap params = SSDKMap()
                      ..setGeneral(
                          "title",
                          "text",
                          [
                            "https://wx3.sinaimg.cn/large/006nLajtly1fpi9ikmj1kj30dw0dwwfq.jpg"
                          ],
                          "https://wx3.sinaimg.cn/large/006nLajtly1fpi9ikmj1kj30dw0dwwfq.jpg",
                          "",
                          "https://www.mob.com/",
                          "https://wx4.sinaimg.cn/large/006WfoFPly1fw9612f17sj30dw0dwgnd.jpg",
                          "https://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT",
                          "https://f1.webshare.mob.com/dvideo/demovideos.mp4",
                          "",
                          SSDKContentTypes.image);
                    SharesdkPlugin.showMenu(null, null, params,
                        (SSDKResponseState state,
                            ShareSDKPlatform platform,
                            dynamic userData,
                            dynamic contentEntity,
                            SSDKError error) {
                      print('${error.rawData}');
                      EasyLoading.showToast('${error.rawData}');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    };
    // 封面
    Align Function(String) renderCover = (String cover) {
      return Align(
        alignment: AlignmentDirectional(0, -1),
        child: Image.network(
          cover,
          width: double.infinity,
          height: 500,
          fit: BoxFit.cover,
        ),
      );
    };
    // 标签栏
    final figureTabbar = TabBar(
      labelColor: FlutterFlowTheme.of(context).primaryText,
      unselectedLabelColor: FlutterFlowTheme.of(context).primaryText,
      labelStyle: FlutterFlowTheme.of(context).subtitle1.override(
            fontFamily: 'Open Sans',
            color: Color(0xFF1D2429),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
      indicatorColor: Color(0xFF1D2429),
      tabs: [
        Tab(
          text: '基本信息',
        ),
        Tab(
          text: '二创',
        ),
        Tab(
          text: '照片',
        ),
      ],
    );

    // 跟随者
    Padding Function() renderFollowers = () {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://images.unsplash.com/photo-1554727242-741c14fa561c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Text(
                'Hastings & 25k followers',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      );
    };

    // 基本信息
    Padding Function(Map<String, dynamic>) renderBasicInfo = (details) {
      List<Widget> list = [];

      if (details.isNotEmpty) {
        details.forEach((key, value) {
          if (details[key].length > 50) {
            list.add(Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$key：', style: FlutterFlowTheme.of(context).bodyText1),
                ],
              ),
            ));
            list.add(
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Text(value,
                          style: FlutterFlowTheme.of(context).bodyText1),
                    ),
                  ),
                ],
              ),
            );
          } else {
            list.add(Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$key：',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(
                    value,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ));
          }
        });
      }
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: list,
        ),
      );
    };

    // 二创
    Padding Function() renderCreation = () {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
        child: ListView(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '4 hour session',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                          child: Text(
                            'Scene Setup 101',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF1D2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Text(
                          '\$500',
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1516357231954-91487b459602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Week Intensive',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                          child: Text(
                            'Adventure Photography',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF1D2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Text(
                          '\$2,000',
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1603574670812-d24560880210?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    };

    // 照片墙
    Padding Function() renderPhotoWall = () {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: Image.network(
                        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuZHNjYXBlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag: 'imageTag7',
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'imageTag7',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuZHNjYXBlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    };

    return FutureBuilder<ApiCallResponse>(
        future: FiguresApiCall.getOne(widget.id),
        builder: (context, snapshot) {
          final figureApiResponse = snapshot.data;

          final figureEntity =
              getJsonField(figureApiResponse?.jsonBody, r'$.data.attributes');
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 75,
                height: 50,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    renderCover(figureEntity['cover']),
                    renderAppbar(figureEntity),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 300, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 700,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x320E151B),
                                        offset: Offset(0, -2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                figureEntity['name'],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: '领养',
                                                options: FFButtonOptions(
                                                  width: 100,
                                                  height: 40,
                                                  color: Color(0xFF4B39EF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                figureEntity['from'],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        renderFollowers(),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 0),
                                            child: DefaultTabController(
                                              length: 3,
                                              initialIndex: 0,
                                              child: Column(
                                                children: [
                                                  figureTabbar,
                                                  Expanded(
                                                    child: TabBarView(
                                                      children: [
                                                        renderBasicInfo(
                                                            figureEntity[
                                                                'details']),
                                                        renderCreation(),
                                                        renderPhotoWall(),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
