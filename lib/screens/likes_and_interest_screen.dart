import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LikesInterestScreen extends BaseRoute {
  final UserProfile userProfile; 
  final bool isEditHobbies;
  const LikesInterestScreen({super.key, super.a, super.o, required this.userProfile, required this.isEditHobbies}) : super(r: 'LikesIntrestScreen');

  @override
  BaseRouteState createState() => _LikesInterestScreenState(userProfile,isEditHobbies);
}

class _LikesInterestScreenState extends BaseRouteState {
  final UserProfile userProfile;
  final UserProfileHandler userProfileHandler = UserProfileHandler();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> _list = [];
  late UserProvider userProvider;
  bool isEditHobbies = false;
  _LikesInterestScreenState(this.userProfile, this.isEditHobbies);
  
  void updateProfileUser() {
    userProfile.hobbies = _list;
    userProvider.setUserProfile(userProfile);
    userProfileHandler.createUserProfile(userProfile);
    userProvider.clearCachedProducts();
  }

  void editProfileUser() {
    userProfile.hobbies = _list;
    userProfileHandler.editUserProfile(userProfile);
    userProvider.clearCachedProducts();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the list only once
    userProvider = Provider.of<UserProvider>(context, listen: false);
    if (isEditHobbies) {
      _list = userProvider.userProfile!.hobbies;
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
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
                      InkWell(

                        onTap: () {
                          
                          setState(() {
                            _list.contains('readers')
                                ? _list.removeWhere((e) => e == 'readers')
                                : _list.add('readers');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('readers')
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
                                      MdiIcons.book,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'readers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color:const Color(0xFF845EB5),
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
                                        MdiIcons.book,
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
                                          'readers',
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
                            _list.contains('pet lovers')
                                ? _list.removeWhere((e) => e == 'pet lovers')
                                : _list.add('pet lovers');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('pet lovers')
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
                                      MdiIcons.paw,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'pet lovers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color:const Color(0xFF845EB5),
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
                                        MdiIcons.paw,
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
                                          'pet lovers',
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
                            _list.contains('gamers')
                                ? _list.removeWhere((e) => e == 'gamers')
                                : _list.add('gamers');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('gamers')
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
                                      Icons.videogame_asset,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'gamers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: const Color(0xFF845EB5),
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
                                          'gamers',
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
                            _list.contains('musicians')
                                ? _list.removeWhere((e) => e == 'musicians')
                                : _list.add('musicians');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('musicians')
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
                                      MdiIcons.music,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'musicians',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color:const Color(0xFF845EB5),
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
                                        MdiIcons.music,
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
                                          'musicians',
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
                            _list.contains('travelers')
                                ? _list.removeWhere((e) => e == 'travelers')
                                : _list.add('travelers');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                        child: !_list.contains('travelers')
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
                                      Icons.travel_explore_outlined,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'travelers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color:const Color(0xFF845EB5),
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
                                Icons.travel_explore_outlined,
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
                                          'travelers',
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
                      /*
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Shopping')
                                ? _list.removeWhere((e) => e == 'Shopping')
                                : _list.add('Shopping');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
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
                                                color: const Color(0xFF845EB5),
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
                          hoverColor: Colors.transparent, // Set hover color to transparent
                         
                          child: !_list.contains('Speeches')
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
                                                  color: const Color(0xFF845EB5),
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
                                          MdiIcons.microphone,
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
                      */
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('artists')
                                ? _list
                                    .removeWhere((e) => e == 'artists')
                                : _list.add('artists');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('artists')
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
                                        'artists',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: const Color(0xFF845EB5),
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
                                          'artists',
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
                      /*
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('Swimming')
                                ? _list.removeWhere((e) => e == 'Swimming')
                                : _list.add('Swimming');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('Swimming')
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
                                                color: const Color(0xFF845EB5),
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
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
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
                                                color: const Color(0xFF845EB5),
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
                      */
                      InkWell(
                        onTap: () {
                          setState(() {
                            _list.contains('chefs')
                                ? _list.removeWhere(
                                    (e) => e == 'chefs')
                                : _list.add('chefs');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('chefs')
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
                                      MdiIcons.chefHat,
                                      color: Color(0xFF845EB5),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 6)
                                          : const EdgeInsets.only(left: 6),
                                      child: Text(
                                        'chefs',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: const Color(0xFF845EB5),
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
                                        MdiIcons.chefHat,
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
                                          'chefs',
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
                            _list.contains('fitness enthusiasts')
                                ? _list.removeWhere((e) => e == 'fitness enthusiasts')
                                : _list.add('fitness enthusiasts');
                          });
                        },
                        hoverColor: Colors.transparent, // Set hover color to transparent
                       
                        child: !_list.contains('fitness enthusiasts')
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
                                        'fitness enthusiasts',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: const Color(0xFF845EB5),
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
                                          'fitness enthusiasts',
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
                          isEditHobbies
                          ? () {
                              editProfileUser();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavigationWidgetLight(
                                currentIndex: 2,
                                a: widget.analytics,
                                o: widget.observer,
                                ),
                              ));
                              isEditHobbies = false;
                            }()
                          : () {
                              updateProfileUser();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                ),
                              )); 
                            }();
                          
                          
                          
                          
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
                    updateProfileUser();
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
