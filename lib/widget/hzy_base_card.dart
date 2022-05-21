import 'package:acg_love/widget/hzy_cached_network_image.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  final String imageUrl;
  final Function onTap;
  const BaseCardWidget({Key key, this.imageUrl, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          this.onTap();
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Image.network(
                    this.imageUrl,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '动漫识别',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  '上传截图动漫来源',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
