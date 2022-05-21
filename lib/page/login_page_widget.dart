import 'dart:async';
import 'dart:convert';

import 'package:acg_love/app_provider.dart';
import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:acg_love/flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:acg_love/flutter_flow/flutter_flow_util.dart';
import 'package:acg_love/flutter_flow/flutter_flow_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

class LoginPageWidget extends ConsumerStatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends ConsumerState<LoginPageWidget> {
  TextEditingController emailAddressController1;
  TextEditingController passwordController1;
  bool passwordVisibility1;
  TextEditingController emailAddressController2;
  TextEditingController passwordController2;
  bool passwordVisibility2;
  TextEditingController codeController;
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String codeText = '获取验证码';
  bool isAgree = false;

  Timer _timer;
  int _countdownTime = 60;

  @override
  void initState() {
    super.initState();
    emailAddressController1 = TextEditingController();
    passwordController1 = TextEditingController();
    passwordVisibility1 = false;
    emailAddressController2 = TextEditingController();
    passwordController2 = TextEditingController();
    passwordVisibility2 = false;
    codeController = TextEditingController();
    isAgree = FFAppState().agreePolicy;
  }

  @override
  Widget build(BuildContext context) {
    // 隐私协议
    Row Function() renderPolicy = () => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToggleIcon(
              onPressed: () async {
                setState(() => isAgree = !isAgree);
                print('隐私协议');
                FFAppState().agreePolicy = isAgree;
                if (isAgree) {
                  SharesdkPlugin.uploadPrivacyPermissionStatus(1,
                      (bool success) {
                    print('success:$success');
                  });
                }
              },
              value: isAgree,
              onIcon: Icon(
                Icons.check_box,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 18,
              ),
              offIcon: Icon(
                Icons.check_box_outline_blank,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 18,
              ),
            ),
            Text(
              '我已阅读并同意',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontWeight: FontWeight.w200,
                  ),
            ),
            Text(
              '《隐私协议》',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ],
        );

    // 注册方法
    registerAction() async {
      print('Button-register pressed ...');
      if (!registerFormKey.currentState.validate()) {
        return;
      }
      EasyLoading.show(status: '注册中..', maskType: EasyLoadingMaskType.black);

      ApiCallResponse resp = await AuthApiCall.registerCall(
          'test123',
          emailAddressController2.text,
          passwordController2.text,
          codeController.text);
      EasyLoading.dismiss();
      if (resp?.statusCode == 200) {
        print('Register success');
        // 注册成功后跳转到登录页面
        print('resp ${resp?.jsonBody}');
        FFAppState().isLogin = true;
        FFAppState().jwtToken = resp?.jsonBody['jwt'];
        FFAppState().userInfo = json.encode(resp?.jsonBody['user']);
        ref.read(isLoginProvider.state).state = true;
        Navigator.pop(context, true);
      } else {
        print('Register failed');
        Fluttertoast.showToast(
            msg: "注册失败:${resp?.jsonBody['error']['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    }

    loginAction() async {
      if (!loginFormKey.currentState.validate()) {
        return;
      }
      if (!isAgree) {
        Fluttertoast.showToast(msg: "请先同意隐私协议");
        return;
      }
      EasyLoading.show(status: '登录中..', maskType: EasyLoadingMaskType.black);

      ApiCallResponse resp = await AuthApiCall.loginApiCall(
        emailAddressController1.text,
        passwordController1.text,
      );
      EasyLoading.dismiss();
      if (resp?.statusCode == 200) {
        print('Register success');
        // 注册成功后跳转到登录页面
        FFAppState().isLogin = true;
        FFAppState().jwtToken = resp?.jsonBody['jwt'];
        FFAppState().userInfo = json.encode(resp?.jsonBody['user']);
        ref.read(isLoginProvider.state).state = true;
        Navigator.pop(context, true);
      } else {
        print('Login failed');
        Fluttertoast.showToast(
            msg: "登录失败:${resp?.jsonBody['error']['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    }

    // 微信登录
    wechatLoginAction() async {
      if (!isAgree) {
        Fluttertoast.showToast(msg: "请先同意隐私协议");
        return;
      }
      EasyLoading.show(status: '登录中..', maskType: EasyLoadingMaskType.black);
      print('Button-Wechat pressed ...');

      SharesdkPlugin.getUserInfo(ShareSDKPlatforms.wechatSession,
          (SSDKResponseState state, dynamic user, SSDKError erro) async {
        Map<String, dynamic> data = json.decode(user['dbInfo']);
        ApiCallResponse resp =
            await AuthApiCall.wechatLoginApiCall(data['token'], data['openid']);
        EasyLoading.dismiss();
        FFAppState().isLogin = true;
        FFAppState().jwtToken = resp?.jsonBody['jwt'];
        FFAppState().userInfo = json.encode(resp?.jsonBody['user']);
        ref.read(isLoginProvider.state).state = true;
        Navigator.pop(context, true);
      });
    }

    // 验证邮箱
    String validEmail(String value) {
      if (value == '') return null;
      RegExp reg = new RegExp(
          r'^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$');
      if (!reg.hasMatch(value)) {
        return '请输入正确的邮箱';
      }
      return null;
    }

    // 验证验证码
    String validCode(String value) {
      if (value == '') return null;
      if (codeController.text.length != 6) {
        return '请输入6位验证码';
      }
      return null;
    }

    // 登录页面表单
    Form loginTabBarView = Form(
      key: loginFormKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: TextFormField(
                controller: emailAddressController1,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: '输入您的邮箱',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF0F1113),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: TextFormField(
                controller: passwordController1,
                obscureText: !passwordVisibility1,
                decoration: InputDecoration(
                  labelText: '输入您的密码',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => passwordVisibility1 = !passwordVisibility1,
                    ),
                    child: Icon(
                      passwordVisibility1
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF57636C),
                      size: 20,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF0F1113),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: loginAction,
                text: '登 录',
                options: FFButtonOptions(
                  width: 230,
                  height: 50,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF4B39EF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 8,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button-ForgotPassword pressed ...');
                },
                text: '忘记密码',
                options: FFButtonOptions(
                  width: 170,
                  height: 40,
                  color: Color(0xFF4B39EF),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 8,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      '其他登录方式',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0x98FFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0F1113),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x3314181B),
                          offset: Offset(0, 2),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF0F1113),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x3314181B),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: InkWell(
                        onTap: wechatLoginAction,
                        child: FaIcon(
                          FontAwesomeIcons.weixin,
                          color: Colors.white,
                          size: 24,
                        ),
                      )),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0F1113),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x3314181B),
                          offset: Offset(0, 2),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0F1113),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x3314181B),
                          offset: Offset(0, 2),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Icon(
                      Icons.phone_sharp,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            renderPolicy()
          ],
        ),
      ),
    );

    // 注册页面
    Form registerTabBarView = Form(
      key: registerFormKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: TextFormField(
                controller: emailAddressController2,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: '邮箱地址',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                ),
                validator: validEmail,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: TextFormField(
                controller: passwordController2,
                obscureText: !passwordVisibility2,
                decoration: InputDecoration(
                  labelText: '输入您的密码',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => passwordVisibility2 = !passwordVisibility2,
                    ),
                    child: Icon(
                      passwordVisibility2
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF57636C),
                      size: 20,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: TextFormField(
                        controller: codeController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '验证码',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        ),
                        validator: validCode,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontWeight: FontWeight.normal,
                            ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      print('Button-send-code pressed ...');

                      if (_countdownTime != 60) {
                        return;
                      }
                      this._timer =
                          Timer.periodic(new Duration(seconds: 1), (timer) {
                        setState(() {
                          _countdownTime--;
                          codeText = '${_countdownTime}s';
                        });
                        if (_countdownTime == 0) {
                          setState(() {
                            _countdownTime = 60;
                            codeText = '获取验证码';
                          });
                          this._timer.cancel();
                        }
                      });
                      await AuthApiCall.confirmEmail(
                        emailAddressController2.text,
                      );
                      Fluttertoast.showToast(
                          msg: "发送成功！",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 12.0);
                    },
                    text: codeText,
                    options: FFButtonOptions(
                      width: 100,
                      height: 36,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF4B39EF),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: registerAction,
                text: '创建账户',
                options: FFButtonOptions(
                  width: 230,
                  height: 50,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF4B39EF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/wechat.png',
                                width: 240,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: 2,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.white,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Tab(
                                      text: '登录',
                                    ),
                                    Tab(
                                      text: '注册',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      loginTabBarView,
                                      registerTabBarView,
                                    ],
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
