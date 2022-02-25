import 'package:flutter/material.dart';

class DropdownButtonPage extends StatelessWidget {
  const DropdownButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("下拉式選單")),
      body: _DropdownButtonFragment(),
    );
  }
}

class _DropdownButtonFragment extends StatefulWidget {
  _DropdownButtonFragment({
    Key? key,
  }) : super(key: key);

  int? selectedValue;

  @override
  State<StatefulWidget> createState() => _DropdownButtonFragmentState();
}

class _DropdownButtonFragmentState extends State<_DropdownButtonFragment> {
  @override
  Widget build(BuildContext context) {
    DropdownButton _button = DropdownButton(
      items: const <DropdownMenuItem>[
        DropdownMenuItem(child: Text("第一項"), value: 1),
        DropdownMenuItem(child: Text("第二項"), value: 2),
        DropdownMenuItem(child: Text("第三項"), value: 3)
      ],
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value;
        });
      },
      hint: const Text("請選擇"),
      value: widget.selectedValue,
    );
    return Center(child: _button);
  }
}
