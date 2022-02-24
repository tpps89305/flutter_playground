import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/text_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerPage extends StatelessWidget {
  const NumberPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _genderRadioGroup =
        _GenderRadioGroup(globalKey: GlobalKey<_GenderRadioGroupState>());

    final _textWidget = TextWidget(GlobalKey<TextWidgetState>());

    final _agePicker = _AgePicker(
        globalKey: GlobalKey<_AgePickerState>(),
        minValue: 0,
        maxValue: 150,
        currentValue: 18);

    final _buttonSubmit = ElevatedButton(
        onPressed: () {
          _textWidget.setText(marrySuggestion(
              _genderRadioGroup.getSelectedItem(),
              _agePicker.getCurrentValue()));
        },
        child: const Text("確認"));

    return Scaffold(
      appBar: AppBar(title: const Text("轉輪")),
      body: Center(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text("性別：")),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: _genderRadioGroup),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text("年齡：")),
          _agePicker,
          _buttonSubmit,
          _textWidget
        ]),
      ),
    );
  }

  marrySuggestion(String gender, int age) {
    if (gender == _GenderRadioGroup.male) {
      if (age <= 27) {
        return "不急";
      } else if (age > 27 && age <= 32) {
        return "開始找對象";
      } else {
        return "佛系脫魯";
      }
    } else if (gender == _GenderRadioGroup.female) {
      if (age <= 25) {
        return "不急";
      } else if (age > 25 && age <= 30) {
        return "開始找對象";
      } else {
        return "佛系脫魯";
      }
    }
  }
}

class _GenderRadioGroup extends StatefulWidget {
  GlobalKey<_GenderRadioGroupState> globalKey;
  static const male = "男生";
  static const female = "女生";

  _GenderRadioGroup({required this.globalKey}) : super(key: globalKey);

  @override
  _GenderRadioGroupState createState() => _GenderRadioGroupState();

  getSelectedItem() => globalKey.currentState?.getSelectedItem();
}

class _GenderRadioGroupState extends State<_GenderRadioGroup> {
  final _genders = const [_GenderRadioGroup.male, _GenderRadioGroup.female];
  var _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];
    for (int i = 0; i < _genders.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: _groupValue,
          title: Text(
            _genders[i],
            style: const TextStyle(fontSize: 18),
          ),
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          }));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );
  }

  getSelectedItem() => _genders[_groupValue];
}

class _AgePicker extends StatefulWidget {
  GlobalKey<_AgePickerState> globalKey;
  var minValue = 0;
  var maxValue = 100;
  var currentValue = 0;

  _AgePicker(
      {required this.globalKey,
      required this.minValue,
      required this.maxValue,
      required this.currentValue})
      : super(key: globalKey);

  @override
  _AgePickerState createState() => _AgePickerState();

  getCurrentValue() => currentValue;
}

class _AgePickerState extends State<_AgePicker> {
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: widget.currentValue,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      onChanged: (newValue) {
        setState(() {
          widget.currentValue = newValue;
        });
      },
    );
  }
}
