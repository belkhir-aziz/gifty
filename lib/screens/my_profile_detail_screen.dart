import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyProfileScreen extends BaseRoute {
  const MyProfileScreen({super.key, super.a, super.o}) : super(r: 'MyProfileScreen');

  @override
  BaseRouteState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;

  _MyProfileScreenState() : super();

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(19, 1, 51, 1),
                    ),
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color:
                      g.isDarkModeEnable ? const Color(0xFF130032) : Colors.white,
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: g.isDarkModeEnable
                                  ? Theme.of(context).iconTheme.color
                                  : Theme.of(context).primaryColorLight,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                '2.7k',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: g.isDarkModeEnable
                            ? const Color(0xFF230f4E)
                            : Colors.purple[100],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: g.isDarkModeEnable
                                  ? Theme.of(context).iconTheme.color
                                  : Theme.of(context).primaryColorLight,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                '3.5k',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: g.isDarkModeEnable
                            ? const Color(0xFF230f4E)
                            : Colors.purple[100],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: g.isDarkModeEnable
                                  ? Theme.of(context).iconTheme.color
                                  : Theme.of(context).primaryColorLight,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                '2.3k',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: g.isDarkModeEnable
                            ? const Color(0xFF230f4E)
                            : Colors.purple[100],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue[900]!,
                              Colors.blueAccent[700]!
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: Icon(
                            Icons.border_color_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  color: g.isDarkModeEnable
                      ? const Color(0xFF130032)
                      : Theme.of(context).scaffoldBackgroundColor,
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  color: const Color(0xFFAD45B3),
                  width: MediaQuery.of(context).size.width / 2 - 35,
                  height: 15,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Mathew Ben',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .displayLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 20)
                          : const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '+01 331 623 8413',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 30,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    'mathew@gmail.com',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 30)
                          : const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_short_bio,
                        style:
                            Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 10)
                          : const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Love music, cooking, swimming, going out,\ntravelling etc. Wanna be friends??',
                        style:
                            Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Theme.of(context).iconTheme.color,
                        onTap: (int index) async {
                          _currentIndex = index;
                          setState(() {});
                        },
                        tabs: [
                          _tabController!.index == 0
                              ? Tab(
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: g.gradientColors,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .lbl_tab_pictures,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .lbl_tab_pictures,
                                  style: const TextStyle(fontSize: 16),
                                ),
                          _tabController!.index == 1
                              ? Tab(
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: g.gradientColors,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .lbl_tab_videos,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .lbl_tab_videos,
                                  style: const TextStyle(fontSize: 16),
                                ),
                          _tabController!.index == 2
                              ? Tab(
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: g.gradientColors,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .lbl_tab_mybio,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .lbl_tab_mybio,
                                  style: const TextStyle(fontSize: 16),
                                ),
                          _tabController!.index == 3
                              ? Tab(
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: g.gradientColors,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .lbl_tab_more,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .lbl_tab_more,
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.12),
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 2.0,
                            ),
                            itemCount: 5,
                            itemBuilder: (ctx, index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 20, left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1D0529)
                                      : Colors.white54,
                                ),
                                height:
                                    (MediaQuery.of(context).size.height *
                                        0.12),
                                width: MediaQuery.of(context).size.width,
                                child: GridTile(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: Image.asset(
                                      'assets/images/sample1.jpg',
                                      height: (MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.12),
                                      width:
                                          MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(),
                          Container(),
                          Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 30)
                          : const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_intrests,
                        style:
                            Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 20, top: 20)
                                    : const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.music,
                                      color: Color(0xFFB783EB),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4),
                                      child: Text(
                                        'Music',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: const Color(0xFFB783EB),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.cookie,
                                      color: Color(0xFFB783EB),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4),
                                      child: Text(
                                        'Cooking',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: const Color(0xFFB783EB),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.swim,
                                      color: Color(0xFFB783EB),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4),
                                      child: Text(
                                        'Swimming',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: const Color(0xFFB783EB),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.travel_explore,
                                      color: Color(0xFFB783EB),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4),
                                      child: Text(
                                        'Travelling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: const Color(0xFFB783EB),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
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
      preferredSize: const Size.fromHeight(65),
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 8),
              alignment: g.isRTL ? Alignment.centerLeft : Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              color: g.isDarkModeEnable
                  ? const Color(0xFF130032)
                  : Theme.of(context).scaffoldBackgroundColor,
              height: 65,
              child: IconButton(
                icon: const Icon(Icons.settings_outlined),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingScreen(
                            a: widget.analytics,
                            o: widget.observer,
                          )));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: g.isRTL ? Alignment.centerRight : Alignment.centerLeft,
              color: const Color(0xFFDC3664),
              width: MediaQuery.of(context).size.width / 2 - 35,
              height: 65,
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
