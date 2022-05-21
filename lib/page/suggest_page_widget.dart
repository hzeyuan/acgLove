import 'dart:convert';
import 'dart:typed_data';

import 'package:acg_love/flutter_flow/flutter_flow_icon_button.dart';
import 'package:acg_love/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class SuggestPageWidget extends StatefulWidget {
  const SuggestPageWidget({Key key}) : super(key: key);

  @override
  _SuggestWidgetState createState() => _SuggestWidgetState();
}

class _SuggestWidgetState extends State<SuggestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userInfo = json.decode(FFAppState().userInfo);
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
            _controller.canGoBack().then((value) {
              if (value) {
                _controller.goBack();
              } else {
                return Navigator.pop(context);
              }
            });
          },
        ),
        title: Text(
          '关于',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '关闭',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FFAppState().isLogin
              ? InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse("https://support.qq.com/product/407282"),
                      method: 'POST',
                      body: Uint8List.fromList(utf8.encode(
                          "openid=${userInfo['email']}&nickname=${userInfo['username']}&avatar=https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epbVnt0IgCawWELps5V2uYR2x7YoFibGT28fV7MmcQjd89lWRVmR46RlZtWa0rGqCw81x0SNOuJ6HQ/132")),
                      headers: {'Content-Type': 'application/json'}),
                  onWebViewCreated: (InAppWebViewController webViewController) {
                    _controller = webViewController;
                  },
                )
              : InAppWebView(
                  initialUrlRequest: URLRequest(
                  url: Uri.parse("https://support.qq.com/product/407282"),
                  method: 'GET',
                )),
        ),
      ),
    );
  }
}
