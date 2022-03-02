import 'package:flutter/material.dart';

class AnimatedListPage extends StatelessWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ["1", "2", "3"];
    var itemLastNum = items.length;
    final GlobalKey<AnimatedListState> itemMenuKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text("清單動畫"),
      ),
      body: AnimatedList(
        key: itemMenuKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => SizeTransition(
          sizeFactor: animation,
          child: ListTile(
            title: Text(items[index]),
            onTap: () {
              items.add((++itemLastNum).toString());
              itemMenuKey.currentState?.insertItem(items.length - 1);
            },
            onLongPress: () {
              var removedItem = items.removeAt(index);
              AnimatedListRemovedItemBuilder builder =
                  (context, animation) => SizeTransition(
                        sizeFactor: animation,
                        child: ListTile(
                            title: Text(
                          removedItem,
                          style: const TextStyle(fontSize: 20),
                        )),
                      );
              itemMenuKey.currentState?.removeItem(index, builder);
            },
          ),
        ),
      ),
    );
  }
}
