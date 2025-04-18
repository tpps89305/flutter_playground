import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MasonryGridViewPage extends StatelessWidget {
  const MasonryGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("不規則格狀清單"),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return _Tile(index: index);
        },
        itemCount: 10,
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final int index;

  _Tile({Key? key, required this.index}) : super(key: key);

  final List<String> titles = [
    "ABCDE",
    "臉談當長告作給",
    "臉談當長告作給海叫色再然聯死做分一於表另，進現現果林老爾的他片心馬目過們"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 240,
            color: Colors.amber,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 90),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titles[index % 3],
                    style: const TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "29 Abc 9999 - 30 Abc 9999",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
