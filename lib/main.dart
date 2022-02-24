import 'package:flutter/material.dart';
import 'package:flutter_playground/button_page.dart';
import 'package:flutter_playground/contents_page.dart';
import 'package:flutter_playground/dropdown_button_page.dart';
import 'package:flutter_playground/navigation_routes.dart';
import 'package:flutter_playground/popup_menu_button_page.dart';
import 'package:flutter_playground/radio_list_page.dart';
import 'package:flutter_playground/snackbar_page.dart';
import 'package:flutter_playground/text_field_page.dart';

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
    NavigationRoutes.radioListPage: ((context) => const RadioListPage())
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
