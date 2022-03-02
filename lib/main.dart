import 'package:flutter/material.dart';
import 'package:flutter_playground/page/animated_cross_fade_page.dart';
import 'package:flutter_playground/page/animated_opacity_page.dart';
import 'package:flutter_playground/page/animation_container_aligment_page.dart';
import 'package:flutter_playground/page/animation_container_page.dart';
import 'package:flutter_playground/page/animation_scale_move_page.dart';
import 'package:flutter_playground/page/animation_transform_page.dart';
import 'package:flutter_playground/page/button_page.dart';
import 'package:flutter_playground/page/checkbox_list_page.dart';
import 'package:flutter_playground/page/contents_page.dart';
import 'package:flutter_playground/page/dropdown_button_page.dart';
import 'package:flutter_playground/page/gallery_page.dart';
import 'package:flutter_playground/page/grid_view_page.dart';
import 'package:flutter_playground/page/image_browser_page.dart';
import 'package:flutter_playground/constants/navigation_routes.dart';
import 'package:flutter_playground/page/image_picker_page.dart';
import 'package:flutter_playground/page/number_picker_page.dart';
import 'package:flutter_playground/page/popup_menu_button_page.dart';
import 'package:flutter_playground/page/radio_list_page.dart';
import 'package:flutter_playground/page/snackbar_page.dart';
import 'package:flutter_playground/page/text_field_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    NavigationRoutes.buttonPage: (context) => const ButtonPage(),
    NavigationRoutes.snackPage: (context) => const SnackbarPage(),
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
    NavigationRoutes.gridViewPage: (context) => const GridViewPage(),
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
        const AnimatedCrossFadePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContentsPage(),
      routes: routes,
    );
  }
}
