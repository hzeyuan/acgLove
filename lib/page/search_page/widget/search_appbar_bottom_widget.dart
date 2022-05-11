import 'package:flutter/material.dart';

import 'search_input_widget.dart';

///实现 PreferredSizeWidget 实现自定义 appbar bottom 控件
class HZYSearchBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  // final SelectItemChanged selectItemChanged;

  final VoidCallback onSubmitPressed;

  final TextEditingController textEditingController;

  HZYSearchBottomWidget({this.onSubmitPressed, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HZYSearchInputWidget(
            controller: textEditingController,
            onSubmitPressed: onSubmitPressed),
      ],
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(64.0);
  }
}
