import 'package:flutter/material.dart';

class FontWeightDemo extends StatelessWidget {
  const FontWeightDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("字型 Weight"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Text 中文 FontWeight.w100",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            ),
            Text(
              "Text 中文 FontWeight.w200",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            ),
            Text(
              "Text 中文 FontWeight.w300",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Text(
              "Text 中文 FontWeight.w400",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Text(
              "Text 中文 FontWeight.w500",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              "Text 中文 FontWeight.w600",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "Text 中文 FontWeight.w700",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              "Text 中文 FontWeight.w800",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Text(
              "Text 中文 FontWeight.w900",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Text 中文 FontWeight.normal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Text(
              "Text 中文 FontWeight.bold",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
