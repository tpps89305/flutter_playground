import 'dart:async';

import 'package:flutter/material.dart';

class LoadingAnimationPage extends StatelessWidget {
  LoadingAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("讀取動畫")),
      body: Center(
        child: FadeLoaderWidget(),
      ),
    );
  }
}

class FadeLoaderWidget extends StatelessWidget {
  final fadeLoaderKey1 = GlobalKey<FadeLoaderState>();
  final fadeLoaderKey2 = GlobalKey<FadeLoaderState>();
  final fadeLoaderKey3 = GlobalKey<FadeLoaderState>();
  final fadeLoaderKey4 = GlobalKey<FadeLoaderState>();
  final fadeLoaderKey5 = GlobalKey<FadeLoaderState>();

  Timer? _timer;
  int timeFlag = 0;

  FadeLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final array = [
      fadeLoaderKey1,
      fadeLoaderKey2,
      fadeLoaderKey3,
      fadeLoaderKey4,
      fadeLoaderKey5,
    ];
    _timer ??= Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        array[timeFlag].currentState?.forward();
        timeFlag++;
        if (timeFlag >= array.length) {
          timeFlag = 0;
        }
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeLoader(fadeLoaderKey1),
        FadeLoader(fadeLoaderKey2),
        FadeLoader(fadeLoaderKey3),
        FadeLoader(fadeLoaderKey4),
        FadeLoader(fadeLoaderKey5),
      ],
    );
  }
}

class FadeLoader extends StatefulWidget {
  // ignore: unused_field
  final GlobalKey<FadeLoaderState> _globalKey;
  double initValue;

  FadeLoader(
    this._globalKey, {
    this.initValue = 1,
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
      duration: const Duration(seconds: 1),
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
        height: 20,
        width: 20,
        color: Colors.amber,
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
