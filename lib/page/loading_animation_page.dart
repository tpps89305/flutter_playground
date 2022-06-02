import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LoadingAnimationPage extends StatelessWidget {
  const LoadingAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("讀取動畫")),
      body: const Center(
        child: FadeLoaderWidget(
          timeOfSecond: 2,
          widgetSize: 36,
          dotSize: 6,
        ),
      ),
    );
  }
}

class FadeLoaderWidget extends StatelessWidget {
  final double widgetSize;
  final double dotSize;
  final int timeOfSecond;

  const FadeLoaderWidget({
    this.widgetSize = 100,
    this.timeOfSecond = 2,
    this.dotSize = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalKeyArray = [];
    for (var i = 0; i < 12; i++) {
      globalKeyArray.add(GlobalKey<FadeLoaderState>());
    }

    Timer? _timer;
    int timeFlag = 0;
    var circel = timeOfSecond * 1000 / 12;
    _timer ??= Timer.periodic(
      Duration(milliseconds: circel.toInt()),
      (timer) {
        globalKeyArray[timeFlag].currentState?.forward();
        timeFlag++;
        if (timeFlag >= globalKeyArray.length) {
          timeFlag = 0;
        }
      },
    );

    return SizedBox.fromSize(
      size: Size.square(widgetSize),
      child: Stack(
        children: List.generate(12, (index) {
          return Transform.rotate(
            angle: 30 * index * (pi / 180),
            child: Align(
              alignment: Alignment.topCenter,
              child: FadeLoader(
                globalKeyArray[index],
                fadeTime: timeOfSecond,
                size: dotSize,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FadeLoader extends StatefulWidget {
  // ignore: unused_field
  final GlobalKey<FadeLoaderState> _globalKey;
  final double initValue;
  final int fadeTime;
  final double size;

  const FadeLoader(
    this._globalKey, {
    this.initValue = 1,
    this.fadeTime = 2,
    this.size = 10,
  }) : super(key: _globalKey);

  @override
  State<StatefulWidget> createState() => FadeLoaderState();
}

class FadeLoaderState extends State<FadeLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: widget.initValue,
      vsync: this,
      duration: Duration(seconds: widget.fadeTime),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  forward() {
    // 即使是在播放中，也重置動畫的狀態。
    _controller.reset();
    _controller.forward();
  }

  stop() {
    _controller.stop();
  }
}
