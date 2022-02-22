import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  TextButton _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Fluttertoast.showToast(
            msg: "按下了 TextButton",
            backgroundColor: Theme.of(context).primaryColorDark);
      },
      child: const Text("TextButton"),
    );
  }

  OutlinedButton _buildOutlinedButton(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "按下了 OutlinedButton",
              backgroundColor: Theme.of(context).primaryColorDark);
        },
        child: const Text("OutlinedButton"),
        style: OutlinedButton.styleFrom(
          primary: Colors.red,
          side: const BorderSide(width: 2, color: Colors.red),
        ));
  }

  ElevatedButton _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
            msg: "按下了 ElevatedButton",
            backgroundColor: Theme.of(context).primaryColorDark);
      },
      child: const Text("ElevatedButton"),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }

  IconButton _buildIconButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "按下了 IconButton",
              backgroundColor: Theme.of(context).primaryColorDark);
        },
        icon: const Icon(Icons.add));
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          Fluttertoast.showToast(
              msg: "按下了 FloatingActionButton",
              backgroundColor: Theme.of(context).primaryColorDark);
        });
  }

  ElevatedButton _buildElevatedButtonWithIcon(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "按下了 ElevatedButtonWithIcon",
              backgroundColor: Theme.of(context).primaryColorDark);
        },
        icon: const Icon(Icons.access_alarm),
        label: const Text("With Icon"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("按鈕")),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildTextButton(context),
            _buildOutlinedButton(context),
            _buildElevatedButton(context),
            _buildIconButton(context),
            _buildFloatingActionButton(context),
            _buildElevatedButtonWithIcon(context)
          ],
        ),
      ),
    );
  }
}
