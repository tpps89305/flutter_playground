import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatelessWidget {
  const AnimatedCrossFadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationWrapper = _AnimationWrapper(
      globalKey: GlobalKey<_AnimationWrapperState>(),
      showFirst: true,
    );

    ElevatedButton button = ElevatedButton(
      onPressed: () {
        animationWrapper.changeState();
      },
      child: const Text("關閉廣告"),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("淡入 / 淡出")),
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
  bool showFirst;

  _AnimationWrapper({required this.globalKey, required this.showFirst})
      : super(key: globalKey);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  changeState() {
    globalKey.currentState?.changeState();
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(
        child: const Text("關閉廣告"),
        width: 100,
        height: 100,
        alignment: Alignment.center,
      ),
      secondChild: const SizedBox(
        child: Icon(Icons.mood),
        width: 100,
        height: 100,
      ),
      crossFadeState: widget.showFirst
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(seconds: 1),
    );
  }

  changeState() {
    setState(() {
      widget.showFirst = !widget.showFirst;
    });
  }
}
