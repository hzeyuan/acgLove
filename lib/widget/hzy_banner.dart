import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HZYBannerWidget extends StatefulWidget {
  final bool autoPlay;
  final List<String> imageList;
  HZYBannerWidget({this.autoPlay, Key key, this.imageList}) : super(key: key);

  @override
  _HZYBannerWidgetState createState() => _HZYBannerWidgetState();
}

class _HZYBannerWidgetState extends State<HZYBannerWidget> {
  Timer _timer;
  int currentIndex = 0;
  PageController pageViewController;

  @override
  void initState() {
    super.initState();
    pageViewController = new PageController(initialPage: currentIndex);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    //间隔两秒时间
    _timer = new Timer.periodic(Duration(milliseconds: 2000), (value) {
      currentIndex++;
      //触发轮播切换
      pageViewController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pageViewController ??= PageController(initialPage: 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              widget.imageList[index % widget.imageList.length],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            );
          },
          onPageChanged: (int index) {
            if (widget.autoPlay) {
              setState(() {
                currentIndex = index;
              });
            }
          },
        ),
        Align(
          alignment: AlignmentDirectional(0, 1),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: SmoothPageIndicator(
              controller: pageViewController ??= PageController(initialPage: 0),
              count: widget.imageList.length,
              axisDirection: Axis.horizontal,
              onDotClicked: (i) {
                pageViewController.animateToPage(
                  i,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 8,
                radius: 16,
                dotWidth: 8,
                dotHeight: 8,
                dotColor: Color(0xFF9E9E9E),
                activeDotColor: Color(0xFFDEDFEE),
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
