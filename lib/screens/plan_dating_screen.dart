import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/buy_tickets_screen.dart';
import 'package:datingapp/screens/dating_matching_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanDatingScreen extends BaseRoute {
  const PlanDatingScreen({super.key, super.a, super.o}) : super(r: 'PlanDatingScreen');

  @override
  BaseRouteState createState() => _PlanDatingScreenState();
}

class _PlanDatingScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;
  final TextEditingController _cSearch = TextEditingController();

  _PlanDatingScreenState() : super();

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
                    builder: (context) => DatingMatchesScreen(
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
                        AppLocalizations.of(context)!.lbl_plan_dating,
                        style: Theme.of(context).primaryTextTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_plan_dating_subtitle,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(2),
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              g.isDarkModeEnable ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        height: 55,
                        child: TextFormField(
                          style: Theme.of(context).primaryTextTheme.titleSmall,
                          controller: _cSearch,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: g.isRTL
                                ? const EdgeInsets.only(right: 22, top: 15)
                                : const EdgeInsets.only(left: 22, top: 15),
                            hintText: AppLocalizations.of(context)!
                                .hint_Searchlbl_Search_Message_match,
                            hintStyle:
                                Theme.of(context).primaryTextTheme.titleSmall,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                FontAwesomeIcons.search,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TabBar(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        labelPadding: g.isRTL
                            ? const EdgeInsets.only(left: 50)
                            : const EdgeInsets.only(right: 50),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: g.isRTL
                            ? const EdgeInsets.only(left: 50)
                            : const EdgeInsets.only(right: 50),
                        isScrollable: true,
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
                                          .lbl_tab_popular,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.lbl_tab_popular,
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
                                          .lbl_tab_events,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.lbl_tab_events,
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
                                          .lbl_tab_parties,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.lbl_tab_parties,
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
                                          .lbl_tab_parties,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.lbl_tab_parties,
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: 6,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BuyTicketsScreen(
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )));
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          color: const Color.fromRGBO(19, 1, 51, 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          child: Image.asset(
                                            'assets/images/plan_dating.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: g.isRTL
                                              ? const EdgeInsets.only(
                                                  right: 20, top: 10)
                                              : const EdgeInsets.only(
                                                  left: 20, top: 10),
                                          height: 30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Grand Concert',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 20, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 20, bottom: 20),
                                              child: Row(
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons.date_range,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '9 May, 2021',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 10, bottom: 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '10PM - 01AM',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 6,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BuyTicketsScreen(
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )));
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          color: const Color.fromRGBO(19, 1, 51, 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          child: Image.asset(
                                            'assets/images/plan_dating.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: g.isRTL
                                              ? const EdgeInsets.only(
                                                  right: 20, top: 10)
                                              : const EdgeInsets.only(
                                                  left: 20, top: 10),
                                          height: 30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Grand Concert',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 20, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 20, bottom: 20),
                                              child: Row(
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons.date_range,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '9 May, 2021',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 10, bottom: 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '10PM - 01AM',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 6,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BuyTicketsScreen(
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )));
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          color: const Color.fromRGBO(19, 1, 51, 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          child: Image.asset(
                                            'assets/images/plan_dating.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: g.isRTL
                                              ? const EdgeInsets.only(
                                                  right: 20, top: 10)
                                              : const EdgeInsets.only(
                                                  left: 20, top: 10),
                                          height: 30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Grand Concert',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 20, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 20, bottom: 20),
                                              child: Row(
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons.date_range,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '9 May, 2021',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 10, bottom: 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '10PM - 01AM',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 6,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BuyTicketsScreen(
                                                a: widget.analytics,
                                                o: widget.observer,
                                              )));
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          color: const Color.fromRGBO(19, 1, 51, 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.5),
                                          child: Image.asset(
                                            'assets/images/plan_dating.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: g.isRTL
                                              ? const EdgeInsets.only(
                                                  right: 20, top: 10)
                                              : const EdgeInsets.only(
                                                  left: 20, top: 10),
                                          height: 30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Grand Concert',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 20, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 20, bottom: 20),
                                              child: Row(
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons.date_range,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '9 May, 2021',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: g.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10, bottom: 20)
                                                  : const EdgeInsets.only(
                                                      left: 10, bottom: 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              134, 34, 84, 1),
                                                          Color.fromRGBO(
                                                              72, 53, 133, 1),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds);
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: g.isRTL
                                                        ? const EdgeInsets.only(
                                                            right: 4)
                                                        : const EdgeInsets.only(
                                                            left: 4),
                                                    child: Text(
                                                      '10PM - 01AM',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
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
