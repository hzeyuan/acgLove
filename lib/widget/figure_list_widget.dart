import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/widget/figure_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FigureListWidget extends StatefulWidget {
  final String title;
  final Function more;
  final Future<ApiCallResponse> future;
  // const FigureListWidget({Key key}) : super(key: key);
  FigureListWidget({this.title, this.more, this.future});

  @override
  State<StatefulWidget> createState() {
    return _FigureListWidgetState();
  }
}

class _FigureListWidgetState extends State<FigureListWidget> {
  Widget buildFigureList(dataList) {
    List<Widget> figureViewList = [];
    for (var figure in dataList) {
      figureViewList.add(FigureAvatarWidget(figure: figure));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // 角色列表
        children: figureViewList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
        future: widget.future,
        builder: (context, snapshot) {
          final figureApiResponse = snapshot.data;
          final dataList = FiguresApiCall.list(figureApiResponse?.jsonBody);
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
          return Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(widget.title,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).title3),
                        InkWell(
                          onTap: widget.more,
                          child: Text('更多',
                              style: FlutterFlowTheme.of(context).subtitle2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            buildFigureList(dataList)
          ]);
        });
  }
}
