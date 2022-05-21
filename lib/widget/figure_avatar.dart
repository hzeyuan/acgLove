import 'package:acg_love/flutter_flow/flutter_flow_util.dart';
import 'package:acg_love/page/detail_page_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

// 动漫头像
class FigureAvatarWidget extends StatelessWidget {
  final figure;
  const FigureAvatarWidget({Key key, this.figure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: DetailPageWidget(id: figure['id']),
            ),
          );
        },
        child: Container(
          width: 128,
          height: 172,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    figure['cover'],
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Text(
                  figure['name'],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
