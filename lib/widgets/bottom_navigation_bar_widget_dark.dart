import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/screens/add_message_screen.dart';
import 'package:datingapp/screens/add_story_screen.dart';
import 'package:datingapp/screens/add_your_story_screen.dart';
import 'package:datingapp/screens/my_profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationWidgetDark extends BaseRoute {
  final int? currentIndex;

  const BottomNavigationWidgetDark({super.key, super.a, super.o, this.currentIndex})
      : super(r: 'BottomNavigationWidgetDark');

  @override
  BaseRouteState<BottomNavigationWidgetDark> createState() =>
      _BottomNavigationWidgetDarkState();
}

class _BottomNavigationWidgetDarkState extends BaseRouteState<BottomNavigationWidgetDark> {
  int? _currentIndex = 0;
  TabController? _tabController;

  _BottomNavigationWidgetDarkState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF140133),
                Color(0xFF140132),
                Color(0xFF140130),
                Color(0xFF15012F),
                Color(0xFF160229),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBar(
            labelColor: Colors.white,
            controller: _tabController,
            indicatorWeight: 3,
            indicatorColor: Theme.of(context).primaryColorLight,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.only(bottom: 56),
            onTap: (int index) async {
              _currentIndex = index;
              setState(() {});
            },
            tabs: [
              _tabController!.index == 0
                  ? const Tab(
                      icon: Icon(
                        MdiIcons.cards,
                      ),
                    )
                  : Tab(
                      icon: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: g.gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: const Icon(MdiIcons.cards)),
                    ),
              _tabController!.index == 1
                  ? const Tab(
                      icon: Icon(
                        Icons.grid_view_rounded,
                      ),
                    )
                  : Tab(
                      icon: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.grid_view_rounded,
                      ),
                    )),
              _tabController!.index == 2
                  ? const Tab(
                      icon: Icon(MdiIcons.messageReplyTextOutline),
                    )
                  : Tab(
                      icon: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(MdiIcons.messageReplyTextOutline),
                    )),
              _tabController!.index == 3
                  ? const Tab(
                      icon: Icon(MdiIcons.account),
                    )
                  : Tab(
                      icon: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: g.gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: const Icon(MdiIcons.account)),
                    ),
            ],
          ),
        ),
      ),
      body: _screens().elementAt(_currentIndex!),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex != null) {
      setState(() {
        _currentIndex = widget.currentIndex;
      });
    }
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _currentIndex!);
    _tabController!.addListener(_tabControllerListener);
  }

  void _tabControllerListener() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  List<Widget> _screens() => [
    AddStoryScreen(a: widget.analytics, o: widget.observer),
    FriendsScreen(a: widget.analytics, o: widget.observer),
    AddMessageScreen(a: widget.analytics, o: widget.observer),
    MyProfileScreen(a: widget.analytics, o: widget.observer),
  ];
}
