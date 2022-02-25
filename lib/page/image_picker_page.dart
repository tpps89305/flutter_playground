import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imagePickerWrapper =
        _ImagePickerWrapper(globalKey: GlobalKey<_ImagePickerWrapperState>());

    final _buttonCameraImage = TextButton(
        onPressed: () {
          _imagePickerWrapper.getImage(ImageSource.camera);
        },
        child: const Text("相機拍照"));

    final _buttonGalleryImage = TextButton(
        onPressed: () {
          _imagePickerWrapper.getImage(ImageSource.gallery);
        },
        child: const Text("挑選相簿照片"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("挑選相片"),
      ),
      body: Center(
          child: Column(
        children: [
          _buttonCameraImage,
          _buttonGalleryImage,
          _imagePickerWrapper
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      )),
    );
  }
}

class _ImagePickerWrapper extends StatefulWidget {
  final GlobalKey<_ImagePickerWrapperState> globalKey;
  const _ImagePickerWrapper({required this.globalKey}) : super(key: globalKey);

  @override
  _ImagePickerWrapperState createState() => _ImagePickerWrapperState();

  getImage(ImageSource imageSource) =>
      globalKey.currentState?.getImage(imageSource);
}

class _ImagePickerWrapperState extends State<_ImagePickerWrapper> {
  File? _imageUrl;

  @override
  Widget build(BuildContext context) {
    if (_imageUrl == null) {
      return const Text("從上面的按鈕挑選相片");
    }
    return Image.file(
      _imageUrl!,
      fit: BoxFit.contain,
    );
  }

  Future<void> getImage(ImageSource imageSource) async {
    XFile? image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) {
      return;
    }
    setState(() {
      _imageUrl = File(image.path);
    });
  }
}
