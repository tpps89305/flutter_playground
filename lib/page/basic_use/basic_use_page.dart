import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/constants.dart';

class BasicUsePage extends StatefulWidget {
  const BasicUsePage({Key? key}) : super(key: key);

  @override
  State<BasicUsePage> createState() => _BasicUsePageState();
}

class _BasicUsePageState extends State<BasicUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基本使用"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Constants.basicUseItems[index].title),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Constants.basicUseItems[index].route);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.blue, height: 1);
        },
        itemCount: Constants.basicUseItems.length,
      ),
    );
  }
}
