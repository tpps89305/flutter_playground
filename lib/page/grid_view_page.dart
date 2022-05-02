import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/wechat_assets_picker_config.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wrapper = _MultiImagePickerWrapper(
        globalKey: GlobalKey<_MultiImagePickerWrapperState>());

    final _buttonPicker = TextButton(
      onPressed: () {
        wrapper.selectImages();
      },
      child: const Text("挑選相片"),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("畫廊")),
      body: Center(
        child: Column(
          children: [_buttonPicker, wrapper],
        ),
      ),
    );
  }
}

class _MultiImagePickerWrapper extends StatefulWidget {
  final GlobalKey<_MultiImagePickerWrapperState> globalKey;
  const _MultiImagePickerWrapper({required this.globalKey})
      : super(key: globalKey);

  @override
  _MultiImagePickerWrapperState createState() =>
      _MultiImagePickerWrapperState();

  selectImages() => globalKey.currentState?.selectImages();
}

class _MultiImagePickerWrapperState extends State<_MultiImagePickerWrapper> {
  List<AssetEntity> _assets = [];
  @override
  Widget build(BuildContext context) {
    if (_assets.isEmpty) {
      return const Text("點擊上面的按鈕挑選相片");
    }
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          _assets.length,
          (index) {
            return Image(
              image: AssetEntityImageProvider(
                _assets[index],
                isOriginal: false,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> selectImages() async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        textDelegate: ChineseTranditionalAssetsPickerTextDelegate(),
      ),
    );
    setState(() {
      _assets = assets ?? [];
    });
    log(assets.toString());
  }
}
