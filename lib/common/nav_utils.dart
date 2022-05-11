import 'package:acg_love/page/search_page/search_page_widget.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  ///搜索
  static Future goSearchPage(BuildContext context, GlobalKey key) {
    // 计算中心位置
    RenderBox renderBox2 = key.currentContext?.findRenderObject() as RenderBox;
    var position = renderBox2.localToGlobal(Offset.zero);
    var size = renderBox2.size;
    var centerPosition = Offset(
      position.dx + size.width / 2,
      position.dy + size.height / 2,
    );
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return SearchPageWidget(centerPosition);
        });
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0x01000000),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }
}
