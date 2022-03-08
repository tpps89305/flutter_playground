import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("底部導覽列"),
      ),
      body: Container(),
      bottomNavigationBar: _BottomNaviBar(),
    );
  }
}

class _BottomNaviBar extends StatefulWidget {
  _BottomNaviBar({Key? key}) : super(key: key);

  var naviItemIcon = [
    const Icon(Icons.phone),
    const Icon(Icons.email),
    const Icon(Icons.message)
  ];

  var naviItemText = ["Phone", "Email", "Line"];

  int selectedIndex = 0;

  @override
  State<_BottomNaviBar> createState() => __BottomNaviBarState();
}

class __BottomNaviBarState extends State<_BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomNaviBarItems = [];

    for (int i = 0; i < widget.naviItemIcon.length; i++) {
      bottomNaviBarItems.add(BottomNavigationBarItem(
          icon: widget.naviItemIcon[i], label: widget.naviItemText[i]));
    }

    return BottomNavigationBar(
      items: bottomNaviBarItems,
      currentIndex: widget.selectedIndex,
      onTap: (index) {
        setState(() {
          widget.selectedIndex = index;
        });
        Fluttertoast.showToast(msg: "選擇了 ${widget.naviItemText[index]}");
      },
    );
  }
}
