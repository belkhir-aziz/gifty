import 'package:datingapp/models/add_your_story_model.dart';
import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/create_story_screen.dart';
import 'package:datingapp/screens/filter_options_screen.dart';
import 'package:datingapp/screens/interest_screen.dart';

import 'package:datingapp/screens/notification_list_screen.dart';
import 'package:datingapp/screens/view_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddYourStoryScreen extends BaseRoute {
  const AddYourStoryScreen({super.key, super.a, super.o}) : super(r: 'AddYourStoryScreen');

  @override
  BaseRouteState createState() => _AddYourStoryScreenState();
}

class _AddYourStoryScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;

  final List<String> circleImageList = [
    'assets/images/img_circle_0.png',
    'assets/images/img_circle_1.png',
    'assets/images/img_circle_2.png',
    'assets/images/img_circle_0.png',
    'assets/images/img_circle_1.png',
    'assets/images/img_circle_2.png',
  ];

  final List<AddYourStory> _storyList = [
    AddYourStory(
        name: 'Belle Benson',
        age: 28,
        km: 1.5,
        imgPath: 'assets/images/card_img_0.png',
        count: 35),
    AddYourStory(
        name: 'Ruby Diaz',
        age: 33,
        km: 1.2,
        imgPath: 'assets/images/card_img_1.png',
        count: 81),
    AddYourStory(
        name: 'Myley Corbyon',
        age: 23,
        km: 1.5,
        imgPath: 'assets/images/card_img_2.png',
        count: 49),
    AddYourStory(
        name: 'Tony Z',
        age: 25,
        km: 2,
        imgPath: 'assets/images/card_img_1.png',
        count: 29),
    AddYourStory(
        name: 'Ruby Raman',
        age: 30,
        km: 1.6,
        imgPath: 'assets/images/card_img_4.png',
        count: 50),
  ];

  _AddYourStoryScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: g.isRTL
                    ? const EdgeInsets.only(right: 15)
                    : const EdgeInsets.only(left: 10),
                child: Image.asset(
                  g.isDarkModeEnable
                      ? 'assets/images/swirl arrow.png'
                      : 'assets/images/swirl arrow_light.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: circleImageList.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          index == 0
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateStoryScreen(
                                            a: widget.analytics,
                                            o: widget.observer,
                                          )))
                              : Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => ViewStoryScreen(
                                            a: widget.analytics,
                                            o: widget.observer,
                                          )));
                        },
                        child: Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(left: 10)
                              : const EdgeInsets.only(right: 10),
                          child: index == 0
                              ? const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFFF1405B),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFFF1405B),
                                    backgroundImage: AssetImage(
                                      circleImageList[index],
                                    ),
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 30),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.only(right: 30),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: Theme.of(context).iconTheme.color,
                  onTap: (int index) async {
                    _currentIndex = index;
                    setState(() {});
                  },
                  tabs: [
                    Tab(text: AppLocalizations.of(context)!.lbl_Tab_All),
                    Tab(text: AppLocalizations.of(context)!.lbl_Tab_Online),
                    Tab(
                        text: AppLocalizations.of(context)!
                            .lbl_Tab_new_daters),
                    Tab(
                        text: AppLocalizations.of(context)!
                            .lbl_Tab_liked_you),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: _storyList.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: g.isDarkModeEnable
                                  ? const Color(0xFF1D0529)
                                  : Colors.white54,
                            ),
                            child: GridTile(
                              header: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor:
                                        Colors.lightGreenAccent[400],
                                  ),
                                ),
                              ),
                              footer: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, bottom: 4),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_storyList[index].name},${_storyList[index].age}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.all(0),
                                          child: Text(
                                            '${_storyList[index].km} km away',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 8),
                                              child: Text(
                                                '${_storyList[index].count}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  '${_storyList[index].imgPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: _storyList.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: g.isDarkModeEnable
                                  ? const Color(0xFF1D0529)
                                  : Colors.white54,
                            ),
                            child: GridTile(
                              header: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor:
                                        Colors.lightGreenAccent[400],
                                  ),
                                ),
                              ),
                              footer: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, bottom: 4),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_storyList[index].name},${_storyList[index].age}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.all(0),
                                          child: Text(
                                            '${_storyList[index].km} km away',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 8),
                                              child: Text(
                                                '${_storyList[index].count}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  '${_storyList[index].imgPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: _storyList.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: g.isDarkModeEnable
                                  ? const Color(0xFF1D0529)
                                  : Colors.white54,
                            ),
                            child: GridTile(
                              header: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor:
                                        Colors.lightGreenAccent[400],
                                  ),
                                ),
                              ),
                              footer: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, bottom: 4),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_storyList[index].name},${_storyList[index].age}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.all(0),
                                          child: Text(
                                            '${_storyList[index].km} km away',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 8),
                                              child: Text(
                                                '${_storyList[index].count}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  '${_storyList[index].imgPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: _storyList.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: g.isDarkModeEnable
                                  ? const Color(0xFF1D0529)
                                  : Colors.white54,
                            ),
                            child: GridTile(
                              header: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor:
                                        Colors.lightGreenAccent[400],
                                  ),
                                ),
                              ),
                              footer: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, bottom: 4),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_storyList[index].name},${_storyList[index].age}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.all(0),
                                          child: Text(
                                            '${_storyList[index].km} km away',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 8),
                                              child: Text(
                                                '${_storyList[index].count}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  '${_storyList[index].imgPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _currentIndex);
    _tabController!.addListener(_tabControllerListener);
  }

  void _tabControllerListener() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        AppLocalizations.of(context)!.lbl_Add_your_Story,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.notifications_rounded,
                          ),
                        ),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotificationListScreen(
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                        },
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Align(
                          alignment: Alignment.bottomRight,
                          child: (Icon(MdiIcons.tuneVerticalVariant))),
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FilterOptionsScreen(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
