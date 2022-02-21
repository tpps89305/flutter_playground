import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("按鈕")),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "按下了 TextButton",
                      backgroundColor: Theme.of(context).primaryColorDark);
                },
                child: const Text("TextButton")),
            OutlinedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "按下了 OutlinedButton",
                      backgroundColor: Theme.of(context).primaryColorDark);
                },
                child: const Text("OutlinedButton")),
            ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "按下了 ElevatedButton",
                      backgroundColor: Theme.of(context).primaryColorDark);
                },
                child: const Text("ElevatedButton"))
          ],
        ),
      ),
    );
  }
}
