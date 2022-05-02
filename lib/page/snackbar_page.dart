import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SnackBar _buildSnackBar() {
      return SnackBar(
        content: const Text("按下了按鈕"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("SnackBox"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar());
          },
        ),
      ),
    );
  }
}
