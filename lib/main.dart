import 'package:flutter/material.dart';
import 'package:flutter_playground/catalogue_page.dart';
import 'package:flutter_playground/constants/catalogue_routes.dart';
import 'package:flutter_playground/page/basic_use/advance_tabbar_page.dart';
import 'package:flutter_playground/page/basic_use/animated_cross_fade_page.dart';
import 'package:flutter_playground/page/basic_use/animated_list_page.dart';
import 'package:flutter_playground/page/basic_use/animated_opacity_page.dart';
import 'package:flutter_playground/page/basic_use/animation_container_aligment_page.dart';
import 'package:flutter_playground/page/basic_use/animation_container_page.dart';
import 'package:flutter_playground/page/basic_use/animation_scale_move_page.dart';
import 'package:flutter_playground/page/basic_use/animation_transform_page.dart';
import 'package:flutter_playground/page/basic_use/app_bar_page.dart';
import 'package:flutter_playground/page/basic_use/base64_to_image_page.dart';
import 'package:flutter_playground/page/basic_use/basic_use_page.dart';
import 'package:flutter_playground/constants/navigation_routes.dart';
import 'package:flutter_playground/page/basic_use/battery_level_page.dart';
import 'package:flutter_playground/page/basic_use/bottom_navigation_bar_page.dart';
import 'package:flutter_playground/page/basic_use/button_page.dart';
import 'package:flutter_playground/page/basic_use/checkbox_list_page.dart';
import 'package:flutter_playground/page/basic_use/dialog_page.dart';
import 'package:flutter_playground/page/basic_use/dropdown_button_page.dart';
import 'package:flutter_playground/page/useful_package/gallery_page.dart';
import 'package:flutter_playground/page/basic_use/image_browser_page.dart';
import 'package:flutter_playground/page/basic_use/image_fit_width_page.dart';
import 'package:flutter_playground/page/useful_package/image_picker_page.dart';
import 'package:flutter_playground/page/basic_use/loading_animation_page.dart';
import 'package:flutter_playground/page/basic_use/network_page.dart';
import 'package:flutter_playground/page/useful_package/number_picker_page.dart';
import 'package:flutter_playground/page/basic_use/popup_menu_button_page.dart';
import 'package:flutter_playground/page/basic_use/radio_list_page.dart';
import 'package:flutter_playground/page/basic_use/tab_bar_page.dart';
import 'package:flutter_playground/page/basic_use/text_field_page.dart';
import 'package:flutter_playground/page/basic_use/transition_page.dart';
import 'package:flutter_playground/page/useful_package/useful_package_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    CatalogueRoutes.basicUse: (context) => const BasicUsePage(),
    CatalogueRoutes.usefulPackage: (context) => UsefulPackagePage(),
    NavigationRoutes.buttonPage: (context) => const ButtonPage(),
    NavigationRoutes.popupMenuButtonPage: (context) =>
        const PopupMenuButtonPage(),
    NavigationRoutes.dropdownButtonPage: (context) =>
        const DropdownButtonPage(),
    NavigationRoutes.textFieldPage: (context) => const TextFieldPage(),
    NavigationRoutes.radioListPage: (context) => const RadioListPage(),
    NavigationRoutes.numberPickerPage: (context) => const NumberPickerPage(),
    NavigationRoutes.checkboxesListPage: (context) => const CheckboxListPage(),
    NavigationRoutes.imageBrowserPage: (context) => const ImageBrowserPage(),
    NavigationRoutes.galleryPage: (context) => const GalleryPage(),
    NavigationRoutes.imagePickerPage: (context) => const ImagePickerPage(),
    NavigationRoutes.animationTransformPage: (context) =>
        const AnimationTransformPage(),
    NavigationRoutes.animationScaleMovePage: (context) =>
        const AnimationScaleMovePage(),
    NavigationRoutes.animatedContainerPage: (context) =>
        const AnimationContainerPage(),
    NavigationRoutes.animatedContainerAligmentPage: (context) =>
        const AnimationContainerAligmentPage(),
    NavigationRoutes.animatedOpacityPage: (context) =>
        const AnimatedOpacityPage(),
    NavigationRoutes.animatedCrossFadePage: (context) =>
        const AnimatedCrossFadePage(),
    NavigationRoutes.animatedListPage: (context) => const AnimatedListPage(),
    NavigationRoutes.transitionPage: (context) => const TransitionPageOne(),
    NavigationRoutes.dialogPage: (context) => const DialogPage(),
    NavigationRoutes.appBarPage: (context) => const AppBarPage(),
    NavigationRoutes.tabBarPage: (context) => const TabBarPage(),
    NavigationRoutes.bottomNavigationBarPage: (context) =>
        const BottomNavigationBarPage(),
    NavigationRoutes.advanceTabbarPage: (context) => const AdvanceTabbarPage(),
    NavigationRoutes.loadingAnimation: (context) =>
        const LoadingAnimationPage(),
    NavigationRoutes.network: (context) => const NetworkPage(),
    NavigationRoutes.base64ToImage: (context) => const Base64ToImagePage(),
    NavigationRoutes.imageFitWidth: (context) => const ImageFitWidthPage(),
    NavigationRoutes.batteryLevel: (context) => const BatteryLevelPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CataloguePage(),
      routes: routes,
    );
  }
}
