import 'package:flutter_playground/item/content_item.dart';

import 'navigation_routes.dart';

class Constants {
  static List<ContentItem> get contentItems {
    List<ContentItem> list = [];
    list.add(ContentItem("按鈕", route: NavigationRoutes.buttonPage));
    list.add(ContentItem("SnackBar", route: NavigationRoutes.snackPage));
    list.add(ContentItem("選單按鈕", route: NavigationRoutes.popupMenuButtonPage));
    list.add(ContentItem("下拉式選單", route: NavigationRoutes.dropdownButtonPage));
    list.add(ContentItem("文字輸入", route: NavigationRoutes.textFieldPage));
    list.add(ContentItem("選單", route: NavigationRoutes.radioListPage));
    list.add(ContentItem("轉輪", route: NavigationRoutes.numberPickerPage));
    list.add(ContentItem("複選清單", route: NavigationRoutes.checkboxesListPage));
    list.add(ContentItem("圖片瀏覽", route: NavigationRoutes.imageBrowserPage));
    list.add(ContentItem("相簿", route: NavigationRoutes.galleryPage));
    list.add(ContentItem("選取相片", route: NavigationRoutes.imagePickerPage));
    return list;
  }

  static const images = [
    "assets/images/birds-on-tree.jpg",
    "assets/images/moon.jpg",
    "assets/images/building.jpg"
  ];
}
