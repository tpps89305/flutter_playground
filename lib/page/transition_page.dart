import 'package:flutter/material.dart';

class TransitionPageOne extends StatelessWidget {
  const TransitionPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newPage = const TransitionPageTwo();

    Widget transitionsToNextPage(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child) {
      return Stack(
        children: [
          SlideTransition(
              position: Tween(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(-1.0, 0.0))
                  .animate(animation1),
              child: this),
          SlideTransition(
              position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                  .animate(animation1),
              child: newPage),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("切換畫面"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionsBuilder: transitionsToNextPage,
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          newPage));
            },
            child: const Text("下一頁")),
      ),
    );
  }
}

class TransitionPageTwo extends StatelessWidget {
  const TransitionPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下一頁"),
      ),
      body: Container(
        color: Colors.green[50],
      ),
    );
  }
}
