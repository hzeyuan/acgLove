import 'package:acg_love/backend/api_requests/api_calls.dart';
import 'package:acg_love/page/search_page/widget/search_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SearchBLoC {
  String get searchText {
    return textEditingController.text;
  }

  ///排序类型
  String type = searchFilterType[0].value;

  ///排序
  String sort = sortType[0].value;

  final TextEditingController textEditingController = TextEditingController();

  ///获取搜索数据
  getDataLogic(int page) async {
    print('搜索输数据');
    if (this.searchText == null || this.searchText?.trim()?.length == 0) {
      EasyLoading.showToast('搜索内容不能为空!');
      return;
    }
    ApiCallResponse result = await FiguresApiCall.search(
      page,
      20,
      text: this.searchText,
      type: type,
      sort: sort,
    );
    return result;
  }
}
