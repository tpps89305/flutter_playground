import 'package:flutter_playground/content_item.dart';
import 'package:flutter_playground/navigation_routes.dart';

class Constants {
  static List<ContentItem> get contentItems {
    List<ContentItem> list = [];
    list.add(ContentItem("按鈕", route: NavigationRoutes.buttonPage));
    list.add(ContentItem("SnackBar", route: NavigationRoutes.snackPage));
    list.add(ContentItem("選單按鈕", route: NavigationRoutes.popupMenuButtonPage));
    list.add(ContentItem("下拉式選單", route: NavigationRoutes.dropdownButtonPage));
    return list;
  }
}
