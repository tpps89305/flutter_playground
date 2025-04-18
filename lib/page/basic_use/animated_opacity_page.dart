import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatelessWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationWrapper = _AnimationWrapper(
        globalKey: GlobalKey<_AnimationWrapperState>(), opacity: 1.0);

    final button = ElevatedButton(
        onPressed: () {
          animationWrapper.setOpacity(0.0);
        },
        child: const Text("變透明"));

    return Scaffold(
      appBar: AppBar(title: const Text("變透明")),
      body: Center(
        child: Column(
          children: [animationWrapper, button],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> globalKey;
  double opacity;

  _AnimationWrapper({required this.globalKey, required this.opacity})
      : super(key: globalKey);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setOpacity(double opacity) {
    globalKey.currentState?.setOpacity(opacity);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      child: const Text("關閉廣告", style: TextStyle(fontSize: 20)),
      opacity: widget.opacity,
      duration: const Duration(seconds: 1),
      onEnd: () {
        setState(() {
          widget.opacity = 1.0;
        });
      },
    );
  }

  setOpacity(double opacity) {
    setState(() {
      widget.opacity = opacity;
    });
  }
}
