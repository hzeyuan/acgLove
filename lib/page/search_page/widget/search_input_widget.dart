import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

// import 'package:gsy_github_app_flutter/common/localization/default_localizations.dart';
// import 'package:gsy_github_app_flutter/common/style/gsy_style.dart';

class HZYSearchInputWidget extends StatelessWidget {
  final TextEditingController controller;

  // final ValueChanged<String> onSubmitted;

  final VoidCallback onSubmitPressed;

  HZYSearchInputWidget({this.controller, this.onSubmitPressed});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: kToolbarHeight,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(0.0)),
          color: Colors.white,
          border:
              new Border.all(color: Theme.of(context).primaryColor, width: 0.3),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColorDark, blurRadius: 4.0)
          ]),
      padding:
          new EdgeInsets.only(left: 20.0, top: 12.0, right: 20.0, bottom: 12.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
            autofocus: false,
            controller: controller,
            decoration: new InputDecoration(
              labelText: '搜索',
              // hintStyle: GSYConstant.middleSubText,
              border: InputBorder.none,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF57636C),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
          )),
          new RawMaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.only(right: 5.0, left: 10.0),
              constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
              child: new Icon(
                Icons.search_sharp,
                size: 24.0,
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
              onPressed: onSubmitPressed)
        ],
      ),
    );
  }
}
