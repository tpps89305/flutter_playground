import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/radio_list_page_fragment.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextButton _presentAlertDialog(BuildContext context) {
      return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("訊息"),
              content: const Text("彈出了一個對話方塊"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("好"),
                )
              ],
            ),
          );
        },
        child: const Text("對話方塊"),
      );
    }

    TextButton _presentAlertDialogWithButtons(BuildContext context) {
      return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text("是否在退出前儲存檔案"),
              contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 1),
                  child: const Text("儲存後退出"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 0),
                  child: const Text("退出但不儲存"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, -1),
                  child: const Text("取消"),
                ),
              ],
            ),
          );
        },
        child: const Text("有數個按鈕的對話方塊"),
      );
    }

    TextButton _presentAlertDialogWithRadioList(BuildContext context) {
      final locationRadioGroup =
          RadioListPageFragment(GlobalKey<RadioListPageFragmentState>());
      return TextButton(
        onPressed: () async {
          var answer = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: locationRadioGroup,
              contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, ""),
                  child: const Text("取消"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    locationRadioGroup.getSelectedItem(),
                  ),
                  child: const Text("確定"),
                ),
              ],
            ),
          );
          log("Answer = $answer", name: "DialogPage");
        },
        child: const Text("有單選清單的對話方塊"),
      );
    }

    TextButton _presentSimpleDialog(BuildContext context) {
      return TextButton(
        onPressed: () async {
          var answer = await showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text("選擇你的精靈"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                children: [
                  SimpleDialogOption(
                    child: const Text("小火龍", style: TextStyle(fontSize: 18)),
                    onPressed: () => Navigator.pop(context, "小火龍"),
                  ),
                  SimpleDialogOption(
                    child: const Text("傑尼龜", style: TextStyle(fontSize: 18)),
                    onPressed: () => Navigator.pop(context, "傑尼龜"),
                  ),
                  SimpleDialogOption(
                    child: const Text("妙蛙種子", style: TextStyle(fontSize: 18)),
                    onPressed: () => Navigator.pop(context, "妙蛙種子"),
                  ),
                ],
              );
            },
          );
          log("Answer = $answer", name: "DialogPage");
        },
        child: const Text("有簡易選項的對話方塊"),
      );
    }

    TextButton _presentCustomDialog(BuildContext context) {
      return TextButton(
        onPressed: () async {
          var answer = await showDialog(
            context: context,
            builder: (context) {
              return WillPopScope(
                // 使對話方塊不會因點擊旁邊的空白區域而消失。
                onWillPop: () async => false,
                child: Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("這是訂做的對話方塊"),
                      ),
                      const Icon(
                        Icons.face_retouching_natural_outlined,
                        size: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "OK");
                        },
                        child: const Text("好"),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          log("Answer = $answer", name: "DialogPage");
        },
        child: const Text("訂做的對話方塊"),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("對話方塊")),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _presentAlertDialog(context),
            _presentAlertDialogWithButtons(context),
            _presentAlertDialogWithRadioList(context),
            _presentSimpleDialog(context),
            _presentCustomDialog(context)
          ],
        ),
      ),
    );
  }
}
