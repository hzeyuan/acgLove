import 'dart:async';
import 'dart:convert';

import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/flutter_flow/flutter_flow_expanded_image_view.dart';
import 'package:acg_love/widget/hzy_banner.dart';
import 'package:acg_love/widget/hzy_progress.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';

class Selfi2AnimePageWidget extends StatefulWidget {
  const Selfi2AnimePageWidget({Key key}) : super(key: key);

  @override
  _Selfi2AnimePageWidgetState createState() => _Selfi2AnimePageWidgetState();
}

class _Selfi2AnimePageWidgetState extends State<Selfi2AnimePageWidget> {
  List<String> _imageList = [
    'assets/images/changmo.jpeg',
    'assets/images/bewhy.jpeg'
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  String _image;
  bool _isGen = false;
  String _animeImage = '';

  @override
  Widget build(BuildContext context) {
    buildAnimeResult() {
      return _animeImage != ''
          ? InkWell(
              onTap: () async {
                _save2album();
              },
              child: Hero(
                tag: 'imageTag',
                transitionOnUserGestures: true,
                child: Image.memory(
                  base64.decode(_animeImage),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.contain,
                ),
              ))
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: SizedBox(
                  width: 75,
                  height: 50,
                  child: SpinKitThreeBounce(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              ));
    }

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
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          '人物动漫化',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child:
                // Generated code for this Stack Widget...
                Stack(
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 2,
                            sigmaY: 2,
                          ),
                          child: Image.asset(
                            'assets/images/selfie2Anime_bg.jpeg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: Color(0x6C000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          '你在动漫长什么样',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x51000000),
                                      offset: Offset(1, 1),
                                      spreadRadius: 12,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    _showBottomSheet();
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/selfie.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 100,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Text(
                                          '拍张照片试试吧！',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _isGen ? buildAnimeResult() : Container(),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                '一些例子',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: Container(
                            width: double.infinity,
                            height: 200,
                            child: HZYBannerWidget(
                              autoPlay: true,
                              imageList: _imageList,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Text(
                          '我们会极力保证你的隐私，你上传的所有照片都不会泄露。',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  // 选择一张照片
  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    child: InkWell(
                  onTap: () async {
                    XFile image;
                    // 选择图片
                    image = await _picker.pickImage(
                        source: ImageSource.gallery); // 相册
                    // List<int> imageBytes = await image.readAsBytes();

                    CroppedFile croppedFile = await ImageCropper().cropImage(
                      sourcePath: image.path,
                      maxWidth: 2048,
                      maxHeight: 2048,
                    );

                    //不压缩
                    List<int> imageBytes = await croppedFile.readAsBytes();
                    //压缩
                    // List<int> imageBytes =
                    //     await FlutterImageCompress.compressWithFile(
                    //   croppedFile.path,
                    //   quality: 100,
                    // );
                    _image = base64Encode(imageBytes);

                    Navigator.pop(context);
                    setState(() {
                      _isGen = true;
                    });

                    await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (alertDialogContext) {
                          return WillPopScope(
                              child: AlertDialog(
                                  title: Center(
                                    child: SizedBox(
                                      width: 75,
                                      height: 50,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  content: Container(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text('服务器资源有限，请稍等片刻...'),
                                      ),
                                      HZYProgressWidget(
                                          future: AnimeApiCall.faceCartoonPic(
                                            _image,
                                          ),
                                          onDone: (data) {
                                            print('回调中打印data:$data');
                                            try {
                                              setState(() {
                                                _animeImage = data['Response']
                                                    ['ResultImage'];
                                              });
                                            } catch (e) {
                                              print('err:${e}');
                                              EasyLoading.showToast('生成失败');
                                              setState(() {
                                                _isGen = false;
                                              });
                                            }

                                            Navigator.pop(alertDialogContext);
                                          }),
                                    ],
                                  ))),
                              onWillPop: () async {
                                return Future.value(false);
                              });
                        });

                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      "选择一张照片",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                  color: FlutterFlowTheme.of(context).lineColor,
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    '取消',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  // 全屏预览照片
  _preview() async {
    await Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: FlutterFlowExpandedImageView(
          image: Image.memory(
            base64.decode(_animeImage),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.contain,
          ),
          allowRotation: false,
          tag: 'imageTag',
          useHeroAnimation: true,
        ),
      ),
    );
  }

  // 保存到相册
  _save2album() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    child: InkWell(
                  onTap: () async {
                    _preview();
                  },
                  child: ListTile(
                    title: Text(
                      "预览",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                    child: InkWell(
                  onTap: () async {
                    // 保存到相册
                    await saveFile(_animeImage, isBase64: true);
                    EasyLoading.showToast('保存成功');
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      "保存到相册",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                  color: FlutterFlowTheme.of(context).lineColor,
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    '取消',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
