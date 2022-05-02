import 'package:flutter/material.dart';

import '../widget/radio_list_page_fragment.dart';
import '../widget/text_widget.dart';

class RadioListPage extends StatelessWidget {
  const RadioListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRadioGroup =
        RadioListPageFragment(GlobalKey<RadioListPageFragmentState>());

    final textResult = TextWidget(GlobalKey<TextWidgetState>());

    final buttonSubmit = ElevatedButton(
      onPressed: () {
        textResult.setText(locationRadioGroup.getSelectedItem());
      },
      child: const Text("確定"),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("選單")),
      body: Center(
        child: Column(
          children: [
            Container(
              child: locationRadioGroup,
              width: 200,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: buttonSubmit,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: textResult,
              margin: const EdgeInsets.symmetric(vertical: 10),
            )
          ],
        ),
      ),
    );
  }
}
