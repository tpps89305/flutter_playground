import 'package:flutter/material.dart';

class AnimationScaleMovePage extends StatelessWidget {
  const AnimationScaleMovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const wrapper = _AnimationWrapper();
    return Scaffold(
      appBar: AppBar(title: const Text("縮放動畫")),
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
    _animation = Tween(begin: 0.5, end: 2.5).animate(curvedAnim)
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
    return Transform(
      child: const Text(
        "Animation",
        style: TextStyle(fontSize: 30),
      ),
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..scale(_animation.value, _animation.value),
    );
  }
}
