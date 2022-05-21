// import 'dart:io';

// import 'package:acg_love/backend/api_requests/api_calls.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../flutter_flow/flutter_flow_icon_button.dart';
// import '../../flutter_flow/flutter_flow_theme.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../flutter_flow/flutter_flow_widgets.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class TraceAnimeWidget extends StatefulWidget {
//   const TraceAnimeWidget({Key key}) : super(key: key);

//   @override
//   _TraceAnimeWidgetState createState() => _TraceAnimeWidgetState();
// }

// class _TraceAnimeWidgetState extends State<TraceAnimeWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final ImagePicker _picker = ImagePicker();
//   bool loading = false;
//   XFile _image;
//   @override
//   void initState() {
//     super.initState();
//     _image = null;
//   }

//   Future getImage(String type) async {
//     XFile image;
//     if (type == 'camera') {
//       image = await _picker.pickImage(source: ImageSource.camera);
//       // await TraceMoeApiCall.searchCall('https://api.trace.moe/search', image);
//     } else {
//       image = await _picker.pickImage(source: ImageSource.gallery); // 相册
//       // if (!image) return;
//       // await TraceMoeApiCall.searchCall('https://api.trace.moe/search', image);
//     }

//     setState(() {
//       _image = image;
//       loading = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: FlutterFlowTheme.of(context).primaryColor,
//         automaticallyImplyLeading: false,
//         leading: FlutterFlowIconButton(
//             borderColor: Colors.transparent,
//             borderRadius: 30,
//             borderWidth: 1,
//             buttonSize: 60,
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: Colors.white,
//               size: 30,
//             ),
//             onPressed: () => _showBottomSheet()),
//         title: Text(
//           'Page Title',
//           style: FlutterFlowTheme.of(context).title2.override(
//                 fontFamily: 'Poppins',
//                 color: Colors.white,
//                 fontSize: 22,
//               ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                 child: Stack(
//                   alignment: AlignmentDirectional(0, -1),
//                   children: [
//                     loading
//                         ? Center(
//                             child: SizedBox(
//                               width: 75,
//                               height: 50,
//                               child: SpinKitThreeBounce(
//                                 color:
//                                     FlutterFlowTheme.of(context).primaryColor,
//                                 size: 50,
//                               ),
//                             ),
//                           )
//                         : _image != null
//                             ? Image.file(
//                                 File(_image.path),
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 300,
//                                 fit: BoxFit.contain,
//                               )
//                             : Image.asset('assets/images/rabbit.jpeg',
//                                 fit: BoxFit.contain),
//                     Align(
//                       alignment: AlignmentDirectional(0, 0.9),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
//                         child: FFButtonWidget(
//                           onPressed: () {
//                             print('Button pressed ...');
//                           },
//                           text: '上传截图',
//                           icon: Icon(
//                             Icons.cloud_upload,
//                             size: 24,
//                           ),
//                           options: FFButtonOptions(
//                             width: double.infinity,
//                             height: 48,
//                             color: FlutterFlowTheme.of(context).primaryColor,
//                             textStyle: TextStyle(
//                               fontSize: 16,
//                             ),
//                             borderSide: BorderSide(
//                               color: Colors.transparent,
//                               width: 1,
//                             ),
//                             borderRadius: 30,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: AlignmentDirectional(0, 0.7),
//                       child: Text(
//                         '提示：通过照片来查询动漫的来源',
//                         style: FlutterFlowTheme.of(context).bodyText2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _showBottomSheet() {
//     showModalBottomSheet<void>(
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                     child: InkWell(
//                   onTap: () {
//                     getImage('camera');
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     title: Text(
//                       "拍摄",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )),
//                 Container(
//                     child: InkWell(
//                   onTap: () {
//                     getImage('gallery');
//                     Navigator.pop(context);
//                   },
//                   child: ListTile(
//                     title: Text(
//                       "选择一张照片",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )),
//                 Container(
//                   color: FlutterFlowTheme.of(context).lineColor,
//                   height: 10,
//                 ),
//                 ListTile(
//                   title: Text(
//                     '取消',
//                     textAlign: TextAlign.center,
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }

// class TraceAnimeResultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {}
// }
