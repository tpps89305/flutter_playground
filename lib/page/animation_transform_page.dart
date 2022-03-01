import 'dart:math';

import 'package:flutter/material.dart';

class AnimationTransformPage extends StatelessWidget {
  const AnimationTransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const wrapper = _AnimationWrapper();
    return Scaffold(
      appBar: AppBar(title: const Text("旋轉動畫")),
      body: const Center(
        child: wrapper,
      ),
    );
  }
}

class _AnimationWrapper extends StatefulWidget {
  const _AnimationWrapper({Key? key}) : super(key: key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();
}

class _AnimationWrapperState extends State<_AnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    
    final curvedAnim =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    
    // 用 .. 忽略不需要的回傳結果
    _animation = Tween(begin: 0.0, end: 2 * pi).animate(curvedAnim)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            _controller.reverse();
            break;
          case AnimationStatus.dismissed:
            _controller.forward();
            break;
          default:
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      child: const Text(
        "Animation",
        style: TextStyle(fontSize: 30),
      ),
      angle: _animation.value,
      alignment: FractionalOffset.center,
    );
  }
}
