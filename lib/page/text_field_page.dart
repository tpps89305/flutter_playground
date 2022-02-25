import 'dart:developer';

import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final _nameWidget = _NameWidget(GlobalKey<_NameWidgetState>());
    TextField textField = TextField(
      controller: controller,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(labelText: "輸入姓名"),
      onSubmitted: (value) {
        log("textField = $value", name: "TextFieldPage");
        _nameWidget.setName(controller.text);
      },
    );
    final _button = ElevatedButton(
        onPressed: () {
          _nameWidget.setName(controller.text);
        },
        child: const Text("確認"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("文字輸入"),
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [textField, _button, _nameWidget],
          )),
    );
  }
}

class _NameWidget extends StatefulWidget {
  final GlobalKey<_NameWidgetState> _key;

  _NameWidget(this._key) : super(key: _key);

  @override
  State<StatefulWidget> createState() => _NameWidgetState();

  setName(String name) {
    _key.currentState?.setName(name);
  }
}

class _NameWidgetState extends State<_NameWidget> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Text("Hi, $_name!", style: const TextStyle(fontSize: 20));
  }

  setName(String name) {
    setState(() {
      _name = name;
    });
  }
}
