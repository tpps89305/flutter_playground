import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/text_widget.dart';

class CheckboxListPage extends StatelessWidget {
  const CheckboxListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textWidget = TextWidget(GlobalKey<TextWidgetState>());
    var hobbies = [
      "游泳",
      "唱歌",
      "聽音樂",
      "騎單車",
      "旅遊",
      "美食",
      "運動",
      "籃球",
      "跳舞",
      "棒球",
      "閱讀",
      "寫作"
    ];
    final hobbyCheckboxes = _CheckboxList(
        globalKey: GlobalKey<_CheckboxListState>(), items: hobbies);

    final buttonSubmit = ElevatedButton(
        onPressed: () {
          List<bool> hobbiesStatues = hobbyCheckboxes.getItemStatus();
          String hobbiesDesc = "";
          for (int i = 0; i < hobbiesStatues.length; i++) {
            if (hobbiesStatues[i]) {
              hobbiesDesc += "#${hobbies[i]} ";
            }
          }
          _textWidget.setText(hobbiesDesc);
        },
        child: const Text("確認"));

    return Scaffold(
      appBar: AppBar(title: const Text("複選清單")),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            hobbyCheckboxes,
            buttonSubmit,
            Container(
              child: _textWidget,
              padding: const EdgeInsets.all(8),
            )
          ],
        ),
      )),
    );
  }
}

class _CheckboxList extends StatefulWidget {
  GlobalKey<_CheckboxListState> globalKey;
  List<String> items;
  final List<bool> _itemStatus = [];

  _CheckboxList({required this.globalKey, required this.items})
      : super(key: globalKey) {
    _itemStatus.clear();
    for (int i = 0; i < items.length; i++) {
      _itemStatus.add(false);
    }
  }

  @override
  _CheckboxListState createState() => _CheckboxListState();

  getItemStatus() => _itemStatus;
}

class _CheckboxListState extends State<_CheckboxList> {
  @override
  Widget build(BuildContext context) {
    List<CheckboxListTile> checkboxes = [];
    for (var i = 0; i < widget._itemStatus.length; i++) {
      checkboxes.add(CheckboxListTile(
          value: widget._itemStatus[i],
          title: Text(widget.items[i]),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (newValue) {
            setState(() {
              widget._itemStatus[i] = newValue!;
            });
          }));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: checkboxes,
    );
  }
}
