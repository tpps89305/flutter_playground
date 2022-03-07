import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = PopupMenuButton(
      itemBuilder: (context) => const [
        PopupMenuItem(child: Text("第一項"), value: 1),
        PopupMenuItem(child: Text("第二項"), value: 2),
        PopupMenuItem(child: Text("第三項"), value: 3),
      ],
      onSelected: (value) {
        switch (value) {
          case 1:
            log("選擇了第一項", name: "AppBarPage");
            break;
          case 2:
            log("選擇了第二項", name: "AppBarPage");
            break;
          case 3:
            log("選擇了第三項", name: "AppBarPage");
            break;
          default:
        }
      },
    );

    final button = IconButton(
        onPressed: () {
          Fluttertoast.showToast(msg: "點擊了按鈕");
        },
        icon: const Icon(Icons.phone_iphone));

    final drawer = Drawer(
      child: ListView(
        padding: const EdgeInsets.only(),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Dispy"),
            accountEmail: Text("tpps89305@hotmail.com"),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage("assets/images/bird.jpg"),
            ),
          ),
          ListTile(
            title: const Text("選項 1"),
            onTap: () {
              Fluttertoast.showToast(msg: "點擊了選項 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("選項 2"),
            onTap: () {
              Fluttertoast.showToast(msg: "點擊了選項 2");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("選項 3"),
            onTap: () {
              Fluttertoast.showToast(msg: "點擊了選項 3");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("標題列"),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
        elevation: 10,
        // 變更狀態列圖示的明暗
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [button, menu],
      ),
      drawer: drawer,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("返回")),
      ),
    );
  }
}
