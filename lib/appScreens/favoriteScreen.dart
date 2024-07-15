import 'package:flutter/material.dart';
import 'package:thread/models/suggested_followersModel.dart';
import 'package:thread/widgets/suggested_followers_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              "Activity",
              style: TextStyle(color: Colors.black),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                height: 44,
                child: TabBar(
                    onTap: (index) {
                      setState(() {
                        _currentTabIndex = index;
                      });
                    },
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                    tabs: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _currentTabIndex == 0
                                      ? Colors.transparent
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Tab(
                            text: "All",
                          )),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _currentTabIndex == 1
                                      ? Colors.transparent
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Tab(
                            text: "Follows",
                          )),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _currentTabIndex == 2
                                      ? Colors.transparent
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Tab(
                            text: "Replies",
                          )),
                    ]),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TabBarView(children: [
              Column(
                children: [
                  ...suggested_followersModelList.map((followers) {
                    return SuggestedFollowersWidgets(
                        suggestedFollowersModel: followers);
                  }),
                ],
              ),
              const Center(child: Text("Follows")),
              const Center(child: Text("Replies")),
            ]),
          ),
        ));
  }
}
