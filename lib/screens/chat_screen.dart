import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/video_calling_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_dark.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:datingapp/widgets/drawer_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:datingapp/generated/app_localizations.dart';

class ChatScreen extends BaseRoute {
  const ChatScreen({super.key, super.a, super.o}) : super(r: 'ChatScreen');

  @override
  BaseRouteState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;
  int _currentIndex = 0;
  final TextEditingController _cMessage = TextEditingController();

  _ChatScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerMenuWidget(
        a: widget.analytics,
        o: widget.observer,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: g.isRTL
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              size: 28,
                            ),
                            color: Theme.of(context).iconTheme.color,
                            onPressed: () {
                              _scaffoldKey.currentState!.openEndDrawer();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: g.isRTL
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffD6376E), Color(0xFFAD45B3)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 1.9,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                            color: Colors.white,
                            onPressed: () {
                              g.isDarkModeEnable
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationWidgetDark(
                                                currentIndex: 2,
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )))
                                  : Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationWidgetLight(
                                                currentIndex: 2,
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )));
                            },
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      top: 50,
                      child: CircleAvatar(
                        radius: 57,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(
                            'assets/images/msg_img.png',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Belle Benson',
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 6),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.lightGreenAccent[400],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/chat icon.png',
                          height: 30,
                        ),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(
                          icon: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [
                                    Color(0xFFFA809D),
                                    Color(0xFFB2205E)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              child: const Icon(FontAwesomeIcons.video)),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoCallingScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          color: g.isDarkModeEnable
                              ? const Color(0xFF3B1159)
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'You',
                                          style: g.isDarkModeEnable
                                              ? Theme.of(context)
                                                  .primaryTextTheme
                                                  .titleMedium
                                              : Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyLarge,
                                        ),
                                      ),
                                      Text(
                                        'Hey,Im Fine, Free now, U?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                '01:12 AM',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelSmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Chip(
                    backgroundColor: g.isDarkModeEnable
                        ? const Color(0xFF1F1828)
                        : const Color(0xFF7974AA),
                    label: Text(
                      'Today',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          color: g.isDarkModeEnable
                              ? const Color(0xFF1C0726)
                              : Colors.white60,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Belle Benson',
                                          style: g.isDarkModeEnable
                                              ? Theme.of(context)
                                                  .primaryTextTheme
                                                  .titleMedium
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                        ),
                                      ),
                                      Text(
                                        'Hi, Good Morning',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                '08:19 AM',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelSmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.77,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          color: g.isDarkModeEnable
                              ? const Color(0xFF3B1159)
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5),
                                      child: Text('You',
                                          style: g.isDarkModeEnable
                                              ? Theme.of(context)
                                                  .primaryTextTheme
                                                  .titleMedium
                                              : Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyLarge),
                                    ),
                                    Text(
                                      'Good Morning, Any plan for today?',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '09:37 AM',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          color: g.isDarkModeEnable
                              ? const Color(0xFF1C0726)
                              : Colors.white60,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Belle Benson',
                                        style: g.isDarkModeEnable
                                            ? Theme.of(context)
                                                .primaryTextTheme
                                                .titleMedium
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                      ),
                                    ),
                                    Text(
                                      'Nothing much, W@H, Yours?',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '09:49 AM',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: g.isDarkModeEnable
            ? const Color(0xFF14012F)
            : Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: TextField(
                style: Theme.of(context).primaryTextTheme.titleSmall,
                controller: _cMessage,
                decoration: InputDecoration(
                  contentPadding: g.isRTL
                      ? const EdgeInsets.only(right: 20)
                      : const EdgeInsets.only(left: 20),
                  hintText:
                      AppLocalizations.of(context)!.lbl_hint_chat_type_msg,
                  hintStyle: Theme.of(context).primaryTextTheme.titleSmall,
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width * 0.45,
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 3,
                indicatorColor: Theme.of(context).primaryColorLight,
                labelColor: Theme.of(context).iconTheme.color,
                unselectedLabelColor: Theme.of(context).primaryColorLight,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.only(bottom: 56),
                labelPadding: const EdgeInsets.all(0),
                onTap: (int index) async {
                  _currentIndex = index;
                  setState(() {});
                },
                tabs: const [
                  Tab(
                    child: Icon(
                      Icons.send,
                      size: 20,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      MdiIcons.emoticonHappy,
                      size: 20,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      MdiIcons.attachment,
                      size: 20,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      MdiIcons.microphone,
                      size: 20,
                    ),
                  ),
                ],
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
}
