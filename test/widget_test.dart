// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_playground/page/basic_use/button_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Check Snackbar Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const TestApp(
        widgetInstanceToTest: ButtonPage(),
      ),
    );
    final finderTextButton = find.text("TextButton");
    await tester.tap(finderTextButton);
    await tester.pumpAndSettle();
    
    // 預期能看到「按下了按鈕」Snackbar
    final finderToast = find.text("按下了 TextButton");
    expect(finderToast, findsOneWidget);
  });
}

class TestApp extends StatelessWidget {
  const TestApp({
    Key? key,
    required this.widgetInstanceToTest,
  }) : super(key: key);

  final Widget widgetInstanceToTest;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widgetInstanceToTest,
    );
  }
}
