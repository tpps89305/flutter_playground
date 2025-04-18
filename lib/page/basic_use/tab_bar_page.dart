import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabBarView = TabBarView(children: [
      Center(
        child: Text("Bike"),
      ),
      Center(
        child: Text("Car"),
      )
    ]);

    return DefaultTabController(
      length: tabBarView.children.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("標籤列"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_bike),
                text: "Bike",
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Car",
              )
            ],
          ),
        ),
        body: tabBarView,
      ),
    );
  }
}
