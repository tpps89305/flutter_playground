import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ContentsPage extends StatelessWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contents"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Constants.contentItems[index].title),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Constants.contentItems[index].route);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.blue, height: 1);
        },
        itemCount: Constants.contentItems.length,
      ),
    );
  }
}
