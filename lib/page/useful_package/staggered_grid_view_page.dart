import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewPage extends StatelessWidget {
  const StaggeredGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("複合格狀清單"),
      ),
      body: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: const [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: _Tile(index: 0),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _Tile(index: 1),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _Tile(index: 2),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _Tile(index: 3),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: _Tile(index: 4),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final int index;

  const _Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text('$index'),
    );
  }
}
