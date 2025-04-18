import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({Key? key}) : super(key: key);

  @override
  State<MobileScannerPage> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("條碼掃描"),
      ),
      body: Stack(
        children: [
          Container(color: Colors.amber),
          MobileScanner(
            controller: _controller,
            onDetect: (capture) {
              _controller.stop();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("訊息"),
                  content: Text("掃描到條碼：${capture.barcodes.first.rawValue}"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _controller.start();
                      },
                      child: const Text("好"),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
