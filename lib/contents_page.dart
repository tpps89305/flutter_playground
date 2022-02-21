import 'package:flutter/material.dart';
import 'package:flutter_playground/constants.dart';
import 'package:flutter_playground/navigation_routes.dart';

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
                Navigator.of(context).pushNamed(NavigationRoutes.buttonPage);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: Colors.blue);
          },
          itemCount: Constants.contentItems.length),
    );
  }
}
