import 'package:acg_love/common/nav_utils.dart';
import 'package:acg_love/flutter_flow/flutter_flow_icon_button.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/widget/figure_list_row.dart';
import 'package:acg_love/widget/hzy_pull_load_widget.dart';
import 'package:acg_love/state/common_list_state.dart';
import 'package:flutter/material.dart';

class AllFigurePageWidget extends StatefulWidget {
  const AllFigurePageWidget({Key key}) : super(key: key);
  // final Offset centerPosition;
  _AllFigurePageWidgetState createState() => _AllFigurePageWidgetState();
}

class _AllFigurePageWidgetState extends State<AllFigurePageWidget>
    with
        AutomaticKeepAliveClientMixin<AllFigurePageWidget>,
        GSYListState<AllFigurePageWidget>,
        SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey rightKey = GlobalKey();

  ///绘制item
  _renderItem(index) {
    var data = pullLoadWidgetControl.dataList[index];
    var figure = data['attributes'];
    return FigureListRowWidget(figure);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => true;

  @override
  bool get needHeader => false;

  @override
  void initState() {
    super.initState();
  }

  // _getData() async {
  //   ApiCallResponse result = await FiguresApiCall.search(page, 20);
  //   return result;
  // }

  // @override
  // requestLoadMore() async {
  //   return await _getData();
  // }

  // @override
  // requestRefresh() async {
  //   return await _getData();
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            // print('IconButton pressed ...');
            Navigator.pop(context);
          },
        ),
        title: Text(
          '角色',
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
            key: rightKey,
            icon: Icon(
              Icons.search_rounded,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 32,
            ),
            onPressed: () async {
              NavigatorUtils.goSearchPage(context, rightKey);
              // await Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.rightToLeftWithFade,
              //     child: SearchPageWidget(),
              //   ),
              // );
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: HZYPullLoadWidget(
        pullLoadWidgetControl,
        (BuildContext context, int index) => _renderItem(index),
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey,
      ),
    );
  }
}
