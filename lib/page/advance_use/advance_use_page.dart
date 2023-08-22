import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/constants.dart';

class AdvanceUsePage extends StatelessWidget {
  const AdvanceUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("進階使用"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Constants.advanceUseItems[index].title),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Constants.advanceUseItems[index].route);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.blue, height: 1);
        },
        itemCount: Constants.advanceUseItems.length,
      ),
    );
  }
}
