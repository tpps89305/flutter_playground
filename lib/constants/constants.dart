import 'package:flutter_playground/item/content_item.dart';

import 'navigation_routes.dart';

class Constants {
  static List<ContentItem> get basicUseItems {
    List<ContentItem> list = [];
    list.add(ContentItem("按鈕、SnackBar", route: NavigationRoutes.buttonPage));
    list.add(ContentItem("選單按鈕", route: NavigationRoutes.popupMenuButtonPage));
    list.add(ContentItem("下拉式選單", route: NavigationRoutes.dropdownButtonPage));
    list.add(ContentItem("文字輸入", route: NavigationRoutes.textFieldPage));
    list.add(ContentItem("選單", route: NavigationRoutes.radioListPage));
    list.add(ContentItem("複選清單", route: NavigationRoutes.checkboxesListPage));
    list.add(ContentItem("圖片瀏覽", route: NavigationRoutes.imageBrowserPage));
    list.add(
        ContentItem("旋轉動畫", route: NavigationRoutes.animationTransformPage));
    list.add(
        ContentItem("縮放動畫", route: NavigationRoutes.animationScaleMovePage));
    list.add(
        ContentItem("動畫物件", route: NavigationRoutes.animatedContainerPage));
    list.add(ContentItem("起飛",
        route: NavigationRoutes.animatedContainerAligmentPage));
    list.add(ContentItem("變透明", route: NavigationRoutes.animatedOpacityPage));
    list.add(
        ContentItem("淡入 / 淡出", route: NavigationRoutes.animatedCrossFadePage));
    list.add(ContentItem("清單動畫", route: NavigationRoutes.animatedListPage));
    list.add(ContentItem("轉場", route: NavigationRoutes.transitionPage));
    list.add(ContentItem("對話方塊", route: NavigationRoutes.dialogPage));
    list.add(ContentItem("標題列", route: NavigationRoutes.appBarPage));
    list.add(ContentItem("標籤列", route: NavigationRoutes.tabBarPage));
    list.add(
        ContentItem("底部導覽列", route: NavigationRoutes.bottomNavigationBarPage));
    list.add(ContentItem("進階標籤頁", route: NavigationRoutes.advanceTabbarPage));
    list.add(ContentItem("讀取動畫", route: NavigationRoutes.loadingAnimation));
    list.add(ContentItem("網路", route: NavigationRoutes.network));
    list.add(ContentItem("圖片解碼", route: NavigationRoutes.base64ToImage));
    list.add(ContentItem("圖片在清單的呈現", route: NavigationRoutes.imageFitWidth));
    list.add(ContentItem("電量（原生程式碼通訊）", route: NavigationRoutes.batteryLevel));
    return list;
  }

  static List<ContentItem> get usefulPackageItems {
    List<ContentItem> list = [
      ContentItem("轉輪", route: NavigationRoutes.numberPickerPage),
      ContentItem("相簿", route: NavigationRoutes.galleryPage),
      ContentItem("選取相片", route: NavigationRoutes.imagePickerPage)
    ];
    return list;
  }

  static const images = [
    "assets/images/birds-on-tree.jpg",
    "assets/images/moon.jpg",
    "assets/images/building.jpg"
  ];

  static const imagesUrl = [
    "https://dispydemo.blob.core.windows.net/newcontainer/birds-on-tree.jpg",
    "https://dispydemo.blob.core.windows.net/newcontainer/building.jpg",
    "https://dispydemo.blob.core.windows.net/newcontainer/moon.jpg"
  ];

  static const base64Image =
      "iVBORw0KGgoAAAANSUhEUgAAAD8AAAA/AQMAAABtkYKcAAAABlBMVEX///8AAABVwtN+AAAAAXRSTlMAQObYZgAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAKBJREFUKJF10LENhDAMBdAvpaDLBJFYw11WygSBCXJjsUakLAAdRRSf0VHBP1ev+v42VM+Qow68USHzLvAEbUjPooUjpL9whcOS4e8VD1ifVu5iD9j0jN88oB/V43QrQSuY1wmZAMsZvLRBYLEdk2NwI1YvPRFcTY6tMlxX7PYZAru9LhuFfawmqZljXiMSR/fXmW9YckcMILA+WmLwb3wByDT/uHCZx9IAAAAASUVORK5CYII=";
}
