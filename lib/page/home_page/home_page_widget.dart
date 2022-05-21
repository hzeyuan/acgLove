import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/common/nav_utils.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/page/all_figure_page_widget.dart';
import 'package:acg_love/page/selfie2Anime_page.dart';
import 'package:acg_love/page/traceanime_page/result_page_widget.dart';
import 'package:acg_love/widget/hzy_base_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../widget/figure_list_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final searchKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 108,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Container(
                              key: searchKey,
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                      child: Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFF95A1AC),
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              NavigatorUtils.goSearchPage(
                                                  context, searchKey);
                                            },
                                          )),
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
                ],
              ),
            ),

            FigureListWidget(
                future: FiguresApiCall.getTopChartsCall(),
                title: '热门游戏角色',
                more: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: AllFigurePageWidget(),
                    ),
                  );
                }),
            FigureListWidget(
                future: FiguresApiCall.getTopChartsCall(),
                title: '热门动漫角色',
                more: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: AllFigurePageWidget(),
                    ),
                  );
                }),
            // Generated code for this GridView Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.vertical,
                children: [
                  BaseCardWidget(
                      imageUrl:
                          'https://creator-cdn.icons8.com/JmCTluIWSLc2GbjTAxCMk8JBzEtBnNFn6AX5nAToqrI/rs:fit:200:200/czM6Ly9pY29uczgu/aWNvbnM4LWNyZWF0/b3ItcHJvZC9pY29u/cy9kdXNrL3Bob3Rv/LXZpZGVvL3N2Z3Np/bXAvY2FtZXJhLnN2/Zw.png',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Selfi2AnimePageWidget(),
                            ));
                      }),
                  BaseCardWidget(
                      imageUrl:
                          'https://creator-cdn.icons8.com/c1xapLhE2jECPWnZ9X8iq1jf5tWHuROjKqpEGMKN4Fs/rs:fit:200:200/czM6Ly9pY29uczgu/aWNvbnM4LWNyZWF0/b3ItcHJvZC9pY29u/cy9kdXNrL3VzZXIt/aW50ZXJmYWNlL3N2/Z3NpbXAvZmluZC1h/bmQtcmVwbGFjZS5z/dmc.png',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TraceAnimeWidget(),
                            ));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
