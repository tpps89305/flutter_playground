import 'dart:async';
import 'package:app_links/app_links.dart';

import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/navigation_routes.dart';

import '../constants/constants.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      print('getInitialAppLink: $appLink');
      // openAppLink(appLink);
      if (appLink.path.contains('book')) {
        Navigator.of(context).pushNamed(NavigationRoutes.buttonPage);
      }
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      if (uri.path.contains('book')) {
        Navigator.of(context).pushNamed(NavigationRoutes.buttonPage);
      }
      // openAppLink(uri);
    });
  }

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
