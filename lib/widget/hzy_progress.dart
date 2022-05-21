import 'dart:async';
import 'dart:math';

import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HZYProgressWidget extends StatefulWidget {
  final Function onDone;
  final Future<ApiCallResponse> future;

  HZYProgressWidget({this.onDone, Key key, this.future}) : super(key: key);

  @override
  _HZYProgressWidgetState createState() => _HZYProgressWidgetState();
}

class _HZYProgressWidgetState extends State<HZYProgressWidget> {
  Timer _timer;
  double value;
  var data;
  @override
  void initState() {
    super.initState();
    value = 0.0;
    print('启动');
    startTimer();
  }

  void cancelTimer() {
    print('取消定时任务');
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    widget.onDone(data);
  }

  void startTimer() {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      setState(() {
        double _value = double.parse(
            (value + new Random().nextInt(20) / 100).toStringAsFixed(2));
        value = _value > 1 ? 1 : _value;
      });
      print(value);
      if (value >= 1) {
        //倒计时秒数为0，取消定时器
        cancelTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
        future: widget.future,
        builder: (context, snapshot) {
          print('snapshot:$snapshot');
          if (snapshot.hasData) {
            if (snapshot.data.statusCode == 200) {
              print('结果:${snapshot.data.jsonBody}');
              data = snapshot.data.jsonBody;

              print('成功');
            }
          }
          return LinearPercentIndicator(
            barRadius: Radius.circular(8),
            percent: value,
            animateFromLastPercent: true,
            // animationDuration: 10000,
            lineHeight: 14,
            animation: true,

            progressColor: FlutterFlowTheme.of(context).primaryColor,
            backgroundColor: Color(0xFFF1F4F8),
            center: Text('${value * 100}%',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
            padding: EdgeInsets.zero,
          );
        });
  }
}
