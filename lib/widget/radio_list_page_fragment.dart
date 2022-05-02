import 'package:flutter/material.dart';

class RadioListPageFragment extends StatefulWidget {
  final GlobalKey<RadioListPageFragmentState> _key;

  const RadioListPageFragment(this._key) : super(key: _key);

  @override
  RadioListPageFragmentState createState() => RadioListPageFragmentState();

  getSelectedItem() => _key.currentState?.getSelectedItem();
}

class RadioListPageFragmentState extends State<RadioListPageFragment> {
  final _locations = ["倫敦", "東京", "臺北"];
  var _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _locations.length; i++) {
      radioItems.add(
        RadioListTile(
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
          },
        ),
      );
    }

    final widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: radioItems,
    );

    return widget;
  }

  getSelectedItem() => _locations[_groupValue];
}
