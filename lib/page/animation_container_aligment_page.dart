import 'package:flutter/material.dart';

class AnimationContainerAligmentPage extends StatelessWidget {
  const AnimationContainerAligmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationWrapper = _AnimationWrapper(
      globalKey: GlobalKey<_AnimationWrapperState>(),
      alignment: Alignment.bottomCenter,
    );

    ElevatedButton button = ElevatedButton.icon(
      onPressed: () {
        animationWrapper.setAlignment(Alignment.topCenter);
      },
      icon: const Icon(Icons.airplanemode_active),
      label: const Text("起飛"),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("起飛")),
      body: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            animationWrapper,
            Container(
              child: button,
              margin: const EdgeInsets.symmetric(vertical: 20),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> globalKey;
  Alignment alignment;
  _AnimationWrapper({required this.globalKey, required this.alignment})
      : super(key: globalKey);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setAlignment(Alignment alignment) {
    globalKey.currentState?.setAlignment(alignment);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: const Icon(Icons.airplanemode_active,
            color: Colors.amber, size: 50),
        alignment: widget.alignment,
        onEnd: () {
          setState(() {
            widget.alignment = Alignment.bottomCenter;
          });
        },
      ),
    );
  }

  setAlignment(Alignment alignment) {
    setState(() {
      widget.alignment = alignment;
    });
  }
}
