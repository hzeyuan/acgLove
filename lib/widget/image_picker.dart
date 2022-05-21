import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final String typeAdd = "typeAdd";
  final String typeImage = "typeImage";
  double imageSize = 50;
  int max = 3;
  List<ImageItem> list = [];
  final picker = ImagePicker();

  Future getImage() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery); // 相册
//    PickedFile pickedFile = await picker.getImage(source: ImageSource.camera);  // 相机
    if (pickedFile != null) {
      setState(() {
        list.insert(0, ImageItem(typeImage, pickedFile.path));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    list.add(ImageItem(typeAdd, ""));
  }

  Widget renderItem(BuildContext context, int index) {
    ImageItem item = list[index];
    if (item.type == typeAdd) {
      return GestureDetector(
        child: Image.asset(
          "images/icon_add_picture.png",
          width: imageSize,
          height: imageSize,
          fit: BoxFit.fill,
        ),
        onTap: getImage,
      );
    }
    return Image.file(
      File(item.path),
      width: imageSize,
      height: imageSize,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110 * max / 3,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return renderItem(context, index);
        },
        itemCount: list.length,
      ),
    );
  }
}

class ImageItem {
  String type;
  String path;

  ImageItem(this.type, this.path);
}
