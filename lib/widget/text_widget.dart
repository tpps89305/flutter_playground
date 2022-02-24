import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final GlobalKey<TextWidgetState> _key;

  const TextWidget(this._key) : super(key: _key);
  @override
  State<StatefulWidget> createState() => TextWidgetState();

  setText(String text) {
    _key.currentState?.setText(text);
  }
}

class TextWidgetState extends State<TextWidget> {
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(fontSize: 20),
    );
  }

  setText(String text) {
    setState(() {
      _text = text;
    });
  }

  setName(String name) {}
}