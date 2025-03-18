import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/change_language_screen.dart';
import 'package:datingapp/screens/dating_matching_screen.dart';
import 'package:datingapp/screens/liked_and_likes_screen.dart';
import 'package:datingapp/screens/notification_list_screen.dart';
import 'package:datingapp/screens/reward_screen.dart';
import 'package:datingapp/screens/select_plan_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_dark.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends BaseRoute {
  const SettingScreen({super.key, super.a, super.o}) : super(r: 'SettingScreen');

  @override
  BaseRouteState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _SettingScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBarWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.lbl_settings,
                style: Theme.of(context).primaryTextTheme.displayLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.lbl_settings_subtitle,
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                ),
              ),
              GestureDetector(
                onTap: () {
                  g.isDarkModeEnable
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomNavigationWidgetDark(
                                currentIndex: 2,
                                a: widget.analytics,
                                o: widget.observer,
                              )))
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomNavigationWidgetLight(
                                currentIndex: 2,
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          child: Text(
                            AppLocalizations.of(context)!.lbl_account,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //todo : update with Likes screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LikedAndLikesScreen(
                            a: widget.analytics,
                            o: widget.observer,
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          child: Text(
                            AppLocalizations.of(context)!.lbl_likes_likes,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).iconTheme.color,
                      size: 18,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.lbl_delete_account,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                height: 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: g.gradientColors,
                  ),
                ),
                child: const Divider(),
              ),
              GestureDetector(
                onTap: () async {
                  g.isDarkModeEnable = !g.isDarkModeEnable;
                  // SharedPreferences sp = await SharedPreferences.getInstance();
                  // sp.setBool('isDarkMode', g.isDarkModeEnable);
                  Phoenix.rebirth(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        g.isDarkModeEnable
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          child: Text(
                            AppLocalizations.of(context)!.lbl_mode,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangeLanguageScreen(
                            a: widget.analytics,
                            o: widget.observer,
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.language,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Language',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.help_center,
                      color: Theme.of(context).iconTheme.color,
                      size: 18,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.lbl_help_centre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ), 
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.privacy_tip,
                      color: Theme.of(context).iconTheme.color,
                      size: 18,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: g.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.lbl_policy,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {
                    g.isDarkModeEnable
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavigationWidgetDark(
                                  currentIndex: 2,
                                  a: widget.analytics,
                                  o: widget.observer,
                                )))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavigationWidgetLight(
                                  currentIndex: 2,
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                  },
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
