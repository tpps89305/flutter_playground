import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/constants.dart';

class Base64ToImagePage extends StatelessWidget {
  const Base64ToImagePage({Key? key}) : super(key: key);

  loadImage() {
    final base64 = base64Decode(Constants.base64Image);
    return base64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("圖片解碼"),
      ),
      body: Container(
        child: Image.memory(loadImage()),
      ),
    );
  }
}
