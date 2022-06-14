import 'package:flutter/material.dart';

SizedBox tabBars(controller) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: controller,
            labelPadding: const EdgeInsets.only(left: 1),
            labelColor: Colors.deepOrange,
            labelStyle: const TextStyle(fontSize: 17),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: const [Tab(text: "Foods"), Tab(text: "Restaurant")],
          ),
        ),
      ],
    ),
  );
}

class HomeTabViews extends StatefulWidget {
  static double currentWidth = 0;

  const HomeTabViews({Key? key, required double currentWidth})
      : super(key: key);

  @override
  State<HomeTabViews> createState() => _HomeTabViewsState();
}

class _HomeTabViewsState extends State<HomeTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HomeTabViews.currentWidth,
      child: Column(
        children: [
          tabBars(_tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(
                  child: Text("Food Tab"),
                ),
                Center(
                  child: Text("Food Tab"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
