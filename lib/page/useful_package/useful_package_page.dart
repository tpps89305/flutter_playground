import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/constants.dart';

class UsefulPackagePage extends StatelessWidget {
  const UsefulPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("好用的輪子"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Constants.usefulPackageItems[index].title),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Constants.usefulPackageItems[index].route);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.blue, height: 1);
        },
        itemCount: Constants.usefulPackageItems.length,
      ),
    );
  }
}
