import 'dart:math';
import 'dart:ui';

import 'package:acg_love/flutter_flow/flutter_flow_icon_button.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/page/search_page/widget/search_bloc.dart';
import 'package:acg_love/page/search_page/widget/search_drawer.dart';
import 'package:acg_love/widget/figure_list_row.dart';
import 'package:acg_love/widget/hzy_pull_load_widget.dart';
import 'package:acg_love/state/common_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'widget/search_appbar_bottom_widget.dart';

class SearchPageWidget extends StatefulWidget {
  // const SearchPageWidget({Key key}) : super(key: key);
  final Offset centerPosition;

  SearchPageWidget(this.centerPosition);
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPageWidget>
    with
        AutomaticKeepAliveClientMixin<SearchPageWidget>,
        GSYListState<SearchPageWidget>,
        SingleTickerProviderStateMixin {
  final SearchBLoC searchBLoC = new SearchBLoC();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController controller;
  Animation animation;
  bool endAnima = false;

  ///绘制item
  _renderItem(index) {
    var data = pullLoadWidgetControl.dataList[index];
    var figure = data['attributes'];
    return FigureListRowWidget(figure);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => false;

  @override
  bool get needHeader => false;

  @override
  void initState() {
    super.initState();

    // 入场动画
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInCubic,
    )..addListener(() {
        setState(() {});
      });

    Future.delayed(new Duration(seconds: 0), () {
      controller.forward().then((_) {
        setState(() {
          endAnima = true;
        });
      });
    });
  }

  ///获取搜索数据
  _getDataLogic() async {
    return await searchBLoC.getDataLogic(page);
  }

  @override
  requestLoadMore() async {
    return await _getDataLogic();
  }

  @override
  requestRefresh() async {
    return await _getDataLogic();
  }

  ///切换tab
  _resolveSelectIndex() {
    clearData();
    showRefreshLoading();
  }

  _search() {
    if (searchBLoC.searchText == null ||
        searchBLoC.searchText?.trim()?.length == 0) {
      EasyLoading.showToast('搜索内容不能为空!');
      return;
    }
    if (isLoading) {
      return;
    }
    _resolveSelectIndex();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Container(
      ///填充剩下半圆颜色
      color: endAnima ? Colors.transparent : Colors.transparent,
      child: CRAnimation(
          minR: MediaQuery.of(context).size.height - 8,
          maxR: 0,
          offset: widget.centerPosition,
          animation: animation as Animation<double>,
          child: Scaffold(
            key: scaffoldKey,
            endDrawer: HZYSearchDrawer(
              (String type) {
                ///排序类型
                searchBLoC.type = type;
                Navigator.pop(context);
                _resolveSelectIndex();
              },
              (String sort) {
                ///排序状态
                searchBLoC.sort = sort;
                Navigator.pop(context);
                _resolveSelectIndex();
              },
            ),
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
                onPressed: () async {
                  controller.reverse().then((_) {
                    Navigator.maybePop(context);
                  });
                },
              ),
              title: Text(
                '搜索',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                    ),
              ),
              actions: [],
              centerTitle: false,
              bottom: HZYSearchBottomWidget(
                textEditingController: searchBLoC.textEditingController,
                onSubmitPressed: () {
                  _search();
                },
              ),
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
          )),
    );
  }
}

class CRAnimation extends StatelessWidget {
  final Offset offset;

  final double minR;

  final double maxR;

  final Widget child;

  final Animation<double> animation;

  CRAnimation({
    this.child,
    this.animation,
    this.offset,
    this.minR,
    this.maxR,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return ClipPath(
          clipper: AnimationClipper(
            value: animation.value,
            minR: minR,
            maxR: maxR,
            offset: offset,
          ),
          child: this.child,
        );
      },
    );
  }
}

class AnimationClipper extends CustomClipper<Path> {
  final double value;

  final double minR;

  final double maxR;

  final Offset offset;

  AnimationClipper({
    this.value,
    this.offset,
    this.minR,
    this.maxR,
  });

  @override
  bool shouldReclip(old) => true;

  @override
  Path getClip(Size size) {
    var path = Path();
    var offset = this.offset ?? Offset(size.width / 2, size.height / 2);

    var maxRadius = minR ?? radiusSize(size, offset);

    var minRadius = maxR ?? 0;

    var radius = lerpDouble(minRadius, maxRadius, value);
    var rect = Rect.fromCircle(
      radius: radius,
      center: offset,
    );

    path.addOval(rect);
    return path;
  }

  double radiusSize(Size size, Offset offset) {
    final height = max(offset.dy, size.height - offset.dy);
    final width = max(offset.dx, size.width - offset.dx);
    return sqrt(width * width + height * height);
  }
}
