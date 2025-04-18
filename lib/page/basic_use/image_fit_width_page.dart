import 'package:flutter/material.dart';

class ImageFitWidthPage extends StatelessWidget {
  const ImageFitWidthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("圖片在清單的呈現")),
      body: ListView(
        children: [
          Image.asset('assets/images/birds-on-tree.jpg'),
          Image.asset('assets/images/building.jpg'),
        ],
      ),
    );
  }
}
