import 'package:example_fish_fortune/presentation/pages/collection/tab/all_fish_tab.dart';
import 'package:example_fish_fortune/presentation/pages/collection/tab/my_collection_tab.dart';
import 'package:example_fish_fortune/presentation/widgets/topbar.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(double.infinity, 46),
                    child: TabBar(
                      tabs: [
                        Tab(child: Text('MY COLLECTION')),
                        Tab(child: Text('ALL FISH')),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      MyCollectionTab(),
                      AllFishTab(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
