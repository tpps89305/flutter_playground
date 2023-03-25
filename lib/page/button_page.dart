import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  SnackBar _buildSnackBar(String message) {
    return SnackBar(
      content: Text(message),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  TextButton _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 TextButton"));
      },
      child: const Text("TextButton"),
    );
  }

  OutlinedButton _buildOutlinedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 OutlinedButton"));
      },
      child: const Text("OutlinedButton"),
      style: OutlinedButton.styleFrom(
        primary: Colors.red,
        side: const BorderSide(width: 2, color: Colors.red),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 ElevatedButton"));
      },
      child: const Text("ElevatedButton"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
    );
  }

  IconButton _buildIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 IconButton"));
      },
      icon: const Icon(Icons.add),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 FloatingActionButton"));
      },
    );
  }

  ElevatedButton _buildElevatedButtonWithIcon(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackBar("按下了 ElevatedButtonWithIcon"));
      },
      icon: const Icon(Icons.access_alarm),
      label: const Text("With Icon"),
    );
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
