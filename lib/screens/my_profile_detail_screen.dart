import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/screens/profile_detail_screen.dart';
import 'package:datingapp/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:provider/provider.dart';


class MyProfileScreen extends BaseRoute {
  const MyProfileScreen({super.key, super.a, super.o}) : super(r: 'MyProfileScreen');

  @override
  BaseRouteState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;
  late UserProvider userProvider;
  final UserProfileHandler userProfileHandler = UserProfileHandler();

  _MyProfileScreenState() : super();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context, listen: false);
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
                      userProvider.userProfile?.gender == "female" ? 'assets/images/profile_women.png' : 'assets/images/profile_men.png',
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
                              //String nbSuperLikes = await userProfileHandler.getItemCountForUser('relations', 'user_id', userProvider.userProfile!.id).toString();
                              child: 
                                FutureBuilder<int>(
                                  future: userProfileHandler.getReactionCountForUser('reactions', 'superLike', 'user_id', userProvider.userProfile!.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Text(
                                        '..',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        'Error: ${snapshot.error}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else {
                                      return Text(
                                        '${snapshot.data ?? 0}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    }
                                  },
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
                              child: 
                                  FutureBuilder<int>(
                                  future: userProfileHandler.getReactionCountForUser('reactions', 'like', 'user_id', userProvider.userProfile!.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Text(
                                        '..',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        'Error: ${snapshot.error}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else {
                                      return Text(
                                        '${snapshot.data ?? 0}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    }
                                  },
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
                              Icons.group,
                              color: g.isDarkModeEnable
                                  ? Theme.of(context).iconTheme.color
                                  : Theme.of(context).primaryColorLight,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: 
                                FutureBuilder<int>(
                                  future: userProfileHandler.getItemCountForUser('relations', 'user_id', userProvider.userProfile!.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Text(
                                        '..',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        'Error: ${snapshot.error}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    } else {
                                      return Text(
                                        '${snapshot.data ?? 0}',
                                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                                      );
                                    }
                                  },
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
                              Colors.purple[900]!,
                              Colors.purple[700]!
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: 
                          CircleAvatar(
                          //todo : edit on click on button, show the same as creation of account
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          
                          child: IconButton(
                            icon: const Icon(Icons.border_color_outlined, 
                            size: 18.0,),
                            color: Colors.white,
                            onPressed: () {
                              if (userProvider.userProfile != null) {
                                
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileDetailScreen(
                                    a: widget.analytics,
                                    o: widget.observer,
                                    userProfile: userProvider.userProfile!,
                                    isUpdate: true,
                                  ),
                                ));
                                
                              } else {                         
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('User profile is not available')),
                                );
                              }
                            },
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
                          '${userProvider.userProfile?.firstName} ${userProvider.userProfile?.lastName}',
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
                                  Icons.cake,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    DateFormat('dd-MM-yyyy').format(userProvider.userProfile?.dateOfBirth.toLocal() ?? DateTime(2000, 1, 1)),
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
                                    '${userProvider.userProfile?.email}',
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
                        AppLocalizations.of(context)!.lbl_likes_intrets,
                        style:
                            Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 10)
                          : const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        '${userProvider.userProfile?.hobbies} etc.',
                        style:
                            Theme.of(context).primaryTextTheme.titleSmall,
                      ),
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
              color: const Color(0xFFAD45B3),
              width: MediaQuery.of(context).size.width / 2 - 35,
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
