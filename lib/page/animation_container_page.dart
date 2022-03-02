import 'package:flutter/material.dart';

class AnimationContainerPage extends StatelessWidget {
  const AnimationContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationWrapper = _AnimationWrapper(
        globalKey: GlobalKey<_AnimationWrapperState>(), barHeight: 100);
    final button = ElevatedButton(
        onPressed: () {
          animationWrapper.setBarHeight(400);
        },
        child: const Text("改變高度"));
    return Scaffold(
      appBar: AppBar(title: const Text("動畫物件")),
      body: Container(
        width: double.maxFinite,
        child: Column(
          children: [animationWrapper, button],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> globalKey;
  double barHeight;
  _AnimationWrapper({required this.globalKey, required this.barHeight})
      : super(key: globalKey);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setBarHeight(double height) {
    globalKey.currentState?.setBarHeight(height);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 60.0,
      height: widget.barHeight,
      color: Colors.orangeAccent,
      duration: const Duration(seconds: 1),
    );
  }

  setBarHeight(double height) {
    setState(() {
      widget.barHeight = height;
    });
  }
}
