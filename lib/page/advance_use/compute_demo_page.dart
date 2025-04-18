import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 多執行緒示範
/// 
/// [參考資料](https://blog.csdn.net/email_jade/article/details/88941434)
class ComputeDemoPage extends StatefulWidget {
  const ComputeDemoPage({Key? key}) : super(key: key);

  @override
  State<ComputeDemoPage> createState() => _ComputeDemoPageState();
}

class _ComputeDemoPageState extends State<ComputeDemoPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("多執行緒"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () async {
                // 非同步方法仍然是在主執行緒運作
                // 當運算量大時，會使畫面凍結。
                // _count = await countEven(1000000000);

                // 將運算程序移至另一個執行緒，可平均負擔，避免畫面凍結。
                _count = await compute(_Tools.countEven, 1000000000);
                setState(() {
                  // 更新畫面
                });
              },
              child: Text(_count.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

/// 開發工具包（模擬專案使用情境）
class _Tools {
  /// 計算偶數的個數（模擬大量運算）
  static Future<int> countEven(int num) async {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
}
