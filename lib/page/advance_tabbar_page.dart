import 'dart:math' as math;
import 'package:flutter/material.dart';

class AdvanceTabbarPage extends StatefulWidget {
  const AdvanceTabbarPage({Key? key}) : super(key: key);

  @override
  State<AdvanceTabbarPage> createState() => _AdvanceTabbarPageState();
}

class _AdvanceTabbarPageState extends State<AdvanceTabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  Widget _listItem(Color color, String title) => Container(
        height: 50,
        color: color,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("進階標籤頁"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/birds-on-tree.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "List",
                  ),
                  Tab(
                    text: "Image",
                  ),
                ],
              ),
            ),
          ),
          SliverVisibility(
            visible: currentIndex == 0,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _listItem(getRandomColor(), "第 $index 個項目");
                },
                childCount: 20,
              ),
            ),
          ),
          SliverVisibility(
            visible: currentIndex == 1,
            sliver: SliverToBoxAdapter(
              child: Image.asset('assets/images/bird.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
