import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/upload_id_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LikesInterestScreen extends BaseRoute {
  const LikesInterestScreen({super.key, super.a, super.o}) : super(r: 'LikesIntrestScreen');

  @override
  BaseRouteState createState() => _LikesInterestScreenState();
}

class _LikesInterestScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _list = [];

  _LikesInterestScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.lbl_likes_intrets,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).primaryTextTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      AppLocalizations.of(context)!
                          .lbl_likes_intrets_subtitle,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                    ),
                  ),
                  Wrap(
                    spacing: 0,
                    runAlignment: WrapAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        padding: const EdgeInsets.all(1.2),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Container(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.photo_camera,
                                color: g.isDarkModeEnable
                                    ? Colors.white
                                    : Theme.of(context).primaryColorLight,
                                size: 20,
                              ),
                              Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 6)
                                    : const EdgeInsets.only(left: 6),
                                child: Text(
                                  'Photography',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Cooking')
                                ? _list.removeWhere((e) => e == 'Cooking')
                                : _list.add('Cooking');
                          });
                        },
                        child: !_list.contains('Cooking')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 30, right: 20)
                                    : const EdgeInsets.only(top: 30, left: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.cookie,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Cooking',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 30, right: 20)
                                    : const EdgeInsets.only(top: 30, left: 20),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        MdiIcons.cookie,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Cooking',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Video Games')
                                ? _list.removeWhere((e) => e == 'Video Games')
                                : _list.add('Video Games');
                          });
                        },
                        child: !_list.contains('Video Games')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.videogame_asset,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Video Games',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.videogame_asset,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Video Games',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        margin: g.isRTL
                            ? const EdgeInsets.only(top: 20, right: 20)
                            : const EdgeInsets.only(top: 20, left: 20),
                        padding: const EdgeInsets.all(1.2),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Container(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                MdiIcons.music,
                                color: g.isDarkModeEnable
                                    ? Colors.white
                                    : Theme.of(context).primaryColorLight,
                                size: 20,
                              ),
                              Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 6)
                                    : const EdgeInsets.only(left: 6),
                                child: Text(
                                  'Music',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(1.2),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Container(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.travel_explore_outlined,
                                color: g.isDarkModeEnable
                                    ? Colors.white
                                    : Theme.of(context).primaryColorLight,
                                size: 20,
                              ),
                              Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 6)
                                    : const EdgeInsets.only(left: 6),
                                child: Text(
                                  'Travelling',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Shopping')
                                ? _list.removeWhere((e) => e == 'Shopping')
                                : _list.add('Shopping');
                          });
                        },
                        child: !_list.contains('Shopping')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Shopping',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag_outlined,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Shopping',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _list.contains('Speeches')
                                  ? _list.removeWhere((e) => e == 'Speeches')
                                  : _list.add('Speeches');
                            });
                          },
                          child: !_list.contains('Speeches')
                              ? Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? const Color(0xFF1B1143)
                                        : Theme.of(context)
                                            .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width *
                                      0.42,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        MdiIcons.microphone,
                                        color: Color(0xFF845EB5),
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Speeches',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  color: Colors.white60,
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.normal,
                                                  letterSpacing: 0),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  padding: const EdgeInsets.all(1.2),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width *
                                      0.42,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: g.gradientColors,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Container(
                                    padding: g.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: g.isDarkModeEnable
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    height: 60,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.shopping_bag_outlined,
                                          color: g.isDarkModeEnable
                                              ? Colors.white
                                              : Theme.of(context)
                                                  .primaryColorLight,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.only(left: 6),
                                          child: Text(
                                            'Speeches',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleSmall,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Art & Crafts')
                                ? _list
                                    .removeWhere((e) => e == 'Art & Crafts')
                                : _list.add('Art & Crafts');
                          });
                        },
                        child: !_list.contains('Art & Crafts')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.palette,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Art & Crafts',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.palette,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Art & Crafts',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Swimming')
                                ? _list.removeWhere((e) => e == 'Swimming')
                                : _list.add('Swimming');
                          });
                        },
                        child: !_list.contains('Swimming')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.swim,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Swimming',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        MdiIcons.swim,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Swimming',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Drinking')
                                ? _list.removeWhere((e) => e == 'Drinking')
                                : _list.add('Drinking');
                          });
                        },
                        child: !_list.contains('Drinking')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.wine_bar,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Drinking',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.wine_bar,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Drinking',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Exstreme Sports')
                                ? _list.removeWhere(
                                    (e) => e == 'Exstreme Sports')
                                : _list.add('Exstreme Sports');
                          });
                        },
                        child: !_list.contains('Exstreme Sports')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.sports_rounded,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Exstreme Sports',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.sports_rounded,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Exstreme Sports',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Fitness')
                                ? _list.removeWhere((e) => e == 'Fitness')
                                : _list.add('Fitness');
                          });
                        },
                        child: !_list.contains('Fitness')
                            ? Container(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(left: 10),
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                decoration: BoxDecoration(
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1B1143)
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      MdiIcons.run,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'Fitness',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Colors.white60,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: g.isRTL
                                    ? const EdgeInsets.only(top: 20, right: 20)
                                    : const EdgeInsets.only(top: 20, left: 20),
                                padding: const EdgeInsets.all(1.2),
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: g.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Container(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: g.isDarkModeEnable
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        MdiIcons.run,
                                        color: g.isDarkModeEnable
                                            ? Colors.white
                                            : Theme.of(context)
                                                .primaryColorLight,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(right: 6)
                                            : const EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Fitness',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
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
                        AppLocalizations.of(context)!.lbl_load_more,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 20),
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: g.gradientColors,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                        },
                        child: Text(
                            AppLocalizations.of(context)!.btn_continue,
                            style: Theme.of(context)
                                .textButtonTheme
                                .style!
                                .textStyle!
                                .resolve({
                              WidgetState.pressed,
                            })),
                      ),
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

  PreferredSize _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.btn_skip,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 14, color: const Color(0xFFDD3663)),
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
