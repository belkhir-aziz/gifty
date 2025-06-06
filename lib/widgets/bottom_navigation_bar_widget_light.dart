import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/screens/add_story_screen.dart';
import 'package:datingapp/screens/add_your_story_screen.dart';
import 'package:datingapp/screens/my_profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationWidgetLight extends BaseRoute {
  final int? currentIndex;

  const BottomNavigationWidgetLight({super.key, super.a, super.o, this.currentIndex})
      : super(r: 'BottomNavigationWidgetLight');

  @override
  BaseRouteState<BottomNavigationWidgetLight> createState() =>
      _BottomNavigationWidgetLightState();
}

class _BottomNavigationWidgetLightState extends BaseRouteState<BottomNavigationWidgetLight> {
  int? _currentIndex = 0;
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            onTap: (int index) async {
              _currentIndex = index;
              setState(() {});
            },
            tabs: [
              Tab(
                icon: Icon(
                  MdiIcons.home,
                  color: _currentIndex == 0 ? g.AppColors.primary : g.AppColors.lightTextSecondary,
                  size: 28,
                ),
              ),
              Tab(
                icon: Icon(
                  MdiIcons.heart,
                  color: _currentIndex == 1 ? g.AppColors.primary : g.AppColors.lightTextSecondary,
                  size: 28,
                ),
              ),
              Tab(
                icon: Icon(
                  MdiIcons.account,
                  color: _currentIndex == 2 ? g.AppColors.primary : g.AppColors.lightTextSecondary,
                  size: 28,
                ),
              ),
            ],
            indicatorColor: g.AppColors.primary,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: g.AppColors.primary,
            unselectedLabelColor: g.AppColors.lightTextSecondary,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AddStoryScreen(a: widget.analytics, o: widget.observer),
          FriendsScreen(a: widget.analytics, o: widget.observer),
          MyProfileScreen(a: widget.analytics, o: widget.observer),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.currentIndex ?? 0,
    );
    _currentIndex = widget.currentIndex ?? 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
