import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/dating_matched_model.dart';
import 'package:datingapp/screens/setting_screen.dart';
import 'package:datingapp/screens/view_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatingMatchesScreen extends BaseRoute {
  const DatingMatchesScreen({super.key, super.a, super.o}) : super(r: 'DatingMatchesScreen');

  @override
  BaseRouteState createState() => _DatingMatchesScreenState();
}

class _DatingMatchesScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;

  final List<DatingMatchedModel> _datingMatchesList = [
    DatingMatchedModel(
        name: 'Ruby Raman',
        time: '12:20 AM',
        description: 'Found from matches proposal',
        imgPath: 'assets/images/img_circle_0.png'),
    DatingMatchedModel(
        name: 'Sara Chistin',
        time: '12:20 AM',
        description: 'Found from matches proposal',
        imgPath: 'assets/images/sample3.png'),
    DatingMatchedModel(
        name: 'Myley Corbyn',
        time: '12:20 AM',
        description: 'Found from matches proposal',
        imgPath: 'assets/images/sample3.png'),
    DatingMatchedModel(
        name: 'Sansa Ban',
        time: '12:20 AM',
        description: 'Found from matches proposal',
        imgPath: 'assets/images/img_circle_0.png'),
    DatingMatchedModel(
        name: 'Belle Benson',
        time: '12:20 AM',
        description: 'Found from matches proposal',
        imgPath: 'assets/images/msg_img.png'),
  ];

  _DatingMatchesScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: g.scaffoldBackgroundGradientColors,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingScreen(
                          a: widget.analytics,
                          o: widget.observer,
                        )));
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocalizations.of(context)!.lbl_dating_matches,
                      style: Theme.of(context).primaryTextTheme.displayLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      AppLocalizations.of(context)!
                          .lbl_check_out_list_of_matches_keep_enjoying,
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                        Tab(
                            text: AppLocalizations.of(context)!
                                .lbl_tab_you_likes),
                        Tab(
                            text: AppLocalizations.of(context)!
                                .lbl_Tab_liked_you),
                        Tab(text: AppLocalizations.of(context)!.lbl_tab_views),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: _datingMatchesList.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 31,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                              _datingMatchesList[index]
                                                  .imgPath!,
                                            ),
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 12)
                                              : const EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${_datingMatchesList[index].name}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                child: Text(
                                                  '${_datingMatchesList[index].description}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Text(
                                                '${_datingMatchesList[index].time} | 29.04.2022',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 32,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewPlanScreen(
                                                    a: widget.analytics,
                                                    o: widget.observer,
                                                  )));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: g.gradientColors,
                                    ),
                                  ),
                                  child: const Divider(),
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 31,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/msg_img.png',
                                            ),
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 12)
                                              : const EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ruby Raman',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                child: Text(
                                                  'Found from matches proposal',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Text(
                                                '12:20 AM | 29.04.2022',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 32,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewPlanScreen(
                                                    a: widget.analytics,
                                                    o: widget.observer,
                                                  )));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: g.gradientColors,
                                    ),
                                  ),
                                  child: const Divider(),
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 31,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/msg_img.png',
                                            ),
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 12)
                                              : const EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ruby Raman',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                child: Text(
                                                  'Found from matches proposal',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Text(
                                                '12:20 AM | 29.04.2022',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 32,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewPlanScreen(
                                                    a: widget.analytics,
                                                    o: widget.observer,
                                                  )));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: g.gradientColors,
                                    ),
                                  ),
                                  child: const Divider(),
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 31,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/msg_img.png',
                                            ),
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 12)
                                              : const EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ruby Raman',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .titleMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                child: Text(
                                                  'Found from matches proposal',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Text(
                                                '12:20 AM | 29.04.2022',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.more_vert,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 32,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewPlanScreen(
                                                    a: widget.analytics,
                                                    o: widget.observer,
                                                  )));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: g.gradientColors,
                                    ),
                                  ),
                                  child: const Divider(),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
}
