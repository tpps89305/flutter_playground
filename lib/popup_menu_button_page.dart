import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuButtonPage extends StatelessWidget {
  const PopupMenuButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PopupMenuButton _button = PopupMenuButton(
      itemBuilder: (context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text("第一項"),
          textStyle: TextStyle(fontSize: 20, color: Colors.black87),
          value: 1,
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          child: Text("第二項"),
          textStyle: TextStyle(fontSize: 20, color: Colors.black87),
          value: 2,
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          child: Text("第三項"),
          textStyle: TextStyle(fontSize: 20, color: Colors.black87),
          value: 3,
        ),
      ],
      color: Colors.yellow,
      icon: const Icon(Icons.edit),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: const Offset(100, 30),
      onSelected: (value) {
        Fluttertoast.showToast(msg: "選擇了 value = $value");
      },
      onCanceled: () {
        log("使用者不選了...", name: "PopupMenuButtonPage");
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("選單按鈕")),
      body: Center(child: _button),
    );
  }
}
