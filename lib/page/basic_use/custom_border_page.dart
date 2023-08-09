import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';
import 'dart:math' as math;

class CustomBorderPage extends StatelessWidget {
  const CustomBorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        title: const Text("描準框"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.7),
            padding: EdgeInsets.only(top: 80, bottom: 36),
            child: Text(
              "請對準銷貨明細左下方QR CODE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          // Mask
          Stack(
            clipBehavior: Clip.none,
            children: [
              _ScannerArea(),
              _ScannerBorder()
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 28),
              alignment: Alignment.topCenter,
              height: double.infinity,
              color: Colors.black.withOpacity(0.7),
              child: Column(
                children: [
                  Text(
                    "消費日期起7日內之發票可進行補登",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "（行動載具補登請持銷貨明細至服務台辦理）",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerBorder extends StatelessWidget {
  const _ScannerBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/img_scanner_border.png',
                height: 36,
                width: 36,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Image.asset(
                  'assets/images/img_scanner_border.png',
                  height: 36,
                  width: 36,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.rotate(
                angle: math.pi,
                child: Image.asset(
                  'assets/images/img_scanner_border.png',
                  height: 36,
                  width: 36,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                child: Image.asset(
                  'assets/images/img_scanner_border.png',
                  height: 36,
                  width: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerArea extends StatelessWidget {
  const _ScannerArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        WidgetMask(
          blendMode: BlendMode.srcOut,
          childSaveLayer: true,
          mask: Container(
            color: Colors.black.withOpacity(0.7),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: 200,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
