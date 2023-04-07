import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/qr_scanner_overlay_shape.dart';

class CustomBorderPage extends StatelessWidget {
  const CustomBorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("描準框"),
      ),
      body: Container(
        decoration: ShapeDecoration(
          color: Colors.lime,
          shape: QrScannerOverlayShape(
            borderColor: Colors.amber,
            borderRadius: 20,
            borderLength: 24,
            borderWidth: 10,
            cutOutSize: 250,
            // cutOutBottomOffset: 60,
          ),
        ),
      ),
    );
  }
}
