import 'package:acg_love/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

typedef void SearchSelectItemChanged<String>(String value);

class HZYSearchDrawer extends StatefulWidget {
  final SearchSelectItemChanged<String> typeCallback;
  final SearchSelectItemChanged<String> sortCallback;

  HZYSearchDrawer(this.typeCallback, this.sortCallback);

  @override
  _HZYSearchDrawerState createState() => _HZYSearchDrawerState();
}

class _HZYSearchDrawerState extends State<HZYSearchDrawer> {
  final double itemWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Container(
        height: double.infinity,
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Container(
          color: Colors.white,
          child: new SingleChildScrollView(
            child: new Column(
              children: _renderList(),
            ),
          ),
        ),
      ),
    );
  }

  _renderList() {
    List<Widget> list = [];
    list.add(new Container(
      width: itemWidth,
    ));
    list.add(_renderTitle('类型'));
    for (int i = 0; i < searchFilterType.length; i++) {
      FilterModel model = searchFilterType[i];
      list.add(_renderItem(model, searchFilterType, i, widget.typeCallback));
      list.add(_renderDivider());
    }
    list.add(_renderTitle('排序'));

    for (int i = 0; i < sortType.length; i++) {
      FilterModel model = sortType[i];
      list.add(_renderItem(model, sortType, i, widget.sortCallback));
      list.add(_renderDivider());
    }
    return list;
  }

  _renderTitle(String title) {
    return new Container(
      color: FlutterFlowTheme.of(context).primaryColor,
      width: itemWidth + 50,
      height: 50.0,
      child: new Center(
        child: new Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  _renderDivider() {
    return Container(
      color: Color(0xff959595),
      width: itemWidth,
      height: 0.3,
    );
  }

  _renderItem(FilterModel model, List<FilterModel> list, int index,
      SearchSelectItemChanged<String> select) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: 50.0,
          child: new Container(
            width: itemWidth,
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Center(
                    child: new Checkbox(
                        value: model.select, onChanged: (value) {})),
                new Center(child: Text(model.name)),
              ],
            ),
          ),
        ),
        new TextButton(
          onPressed: () {
            setState(() {
              for (FilterModel model in list) {
                model.select = false;
              }
              list[index].select = true;
            });
            select?.call(model.value);
          },
          child: new Container(
            width: itemWidth,
          ),
        )
      ],
    );
  }
}

class FilterModel {
  String name;
  String value;
  bool select;

  FilterModel({this.name, this.value, this.select});
}

var sortType = [
  FilterModel(name: '从低到高', value: 'desc', select: true),
  FilterModel(name: '从高到低', value: 'asc', select: false),
];
var searchFilterType = [
  FilterModel(name: "热度", value: 'hot', select: true),
  FilterModel(name: "性别", value: 'sex', select: false),
];
