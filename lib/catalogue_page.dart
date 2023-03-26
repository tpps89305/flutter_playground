import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/catalogue_routes.dart';

import 'constants/navigation_routes.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
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
      log('getInitialAppLink: $appLink');
      if (appLink.path.contains('book')) {
        Navigator.of(context).pushNamed(NavigationRoutes.buttonPage);
      }
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      log('onAppLink: $uri');
      if (uri.path.contains('book')) {
        Navigator.of(context).pushNamed(NavigationRoutes.buttonPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.lime.shade200,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CatalogueRoutes.basicUse);
              },
              child: const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    "基本使用",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.amber.shade200,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CatalogueRoutes.usefulPackage);
              },
              child: const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    "好用的輪子",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
