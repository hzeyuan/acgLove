import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/widget/figure_list_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FigureListWidget extends StatefulWidget {
  final FigureListRowWidget rowWidget;

  // const FigureListWidget({Key key}) : super(key: key);
  FigureListWidget({this.rowWidget});

  @override
  State<StatefulWidget> createState() {
    return _FigureListWidgetState();
  }
}

class _FigureListWidgetState extends State<FigureListWidget> {
  Widget buildFigureList(dataList) {
    List<Widget> figureViewList = [];
    for (var figure in dataList) {
      figureViewList.add(widget.rowWidget != null
          ? widget.rowWidget
          : FigureListRowWidget(figure));
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // 角色列表
          children: figureViewList,
        ),
      ),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
        future: FiguresApiCall.getTopChartsCall(),
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
          return buildFigureList(dataList);
        });
  }
}
