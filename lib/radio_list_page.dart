import 'package:flutter/material.dart';

class RadioListPage extends StatelessWidget {
  const RadioListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRadioGroup =
        _RadioListPageFragment(GlobalKey<_RadioListPageFragmentState>());

    final textResult = _TextWidget(GlobalKey<_TextWidgetState>());

    final buttonSubmit = ElevatedButton(
        onPressed: () {
          textResult.setText(locationRadioGroup.getSelectedItem());
        },
        child: const Text("確定"));

    return Scaffold(
      appBar: AppBar(title: const Text("選單")),
      body: Center(
          child: Column(
        children: [
          Container(
            child: locationRadioGroup,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: buttonSubmit,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: textResult,
            margin: const EdgeInsets.symmetric(vertical: 10),
          )
        ],
      )),
    );
  }
}

class _RadioListPageFragment extends StatefulWidget {
  final GlobalKey<_RadioListPageFragmentState> _key;

  const _RadioListPageFragment(this._key) : super(key: _key);

  @override
  _RadioListPageFragmentState createState() => _RadioListPageFragmentState();

  getSelectedItem() => _key.currentState?.getSelectedItem();
}

class _RadioListPageFragmentState extends State<_RadioListPageFragment> {
  final _locations = ["倫敦", "東京", "臺北"];
  var _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _locations.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: _groupValue,
          title: Text(_locations[i],
              style: const TextStyle(
                fontSize: 20,
              )),
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          }));
    }

    final widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return widget;
  }

  getSelectedItem() => _locations[_groupValue];
}

class _TextWidget extends StatefulWidget {
  final GlobalKey<_TextWidgetState> _key;

  const _TextWidget(this._key) : super(key: _key);
  @override
  State<StatefulWidget> createState() => _TextWidgetState();

  setText(String text) {
    _key.currentState?.setText(text);
  }
}

class _TextWidgetState extends State<_TextWidget> {
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
