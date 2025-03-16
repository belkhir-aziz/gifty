import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';

class StartDatingScreen extends BaseRoute {
  const StartDatingScreen({super.key, super.a, super.o})
      : super(r: 'StartDatingScreen');

  @override
  BaseRouteState createState() => _StartDatingScreenState();
}

class _StartDatingScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _StartDatingScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  AppLocalizations.of(context)!.lbl_online_dating_app,
                  style: Theme.of(context).primaryTextTheme.headlineMedium,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.lbl_start_dating_subtitle1,
                style: Theme.of(context).primaryTextTheme.headlineSmall,
              ),
              Text(
                AppLocalizations.of(context)!.lbl_start_dating_subtitle2,
                style: Theme.of(context).primaryTextTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  AppLocalizations.of(context)!.lbl_start_dating_subtitle3,
                  style: TextStyle(
                    color: g.isDarkModeEnable
                        ? Colors.white70
                        : const Color(0xFF5E50E5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.lbl_play_video,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Image.asset(
                g.isDarkModeEnable
                    ? 'assets/images/start_dating_new.png'
                    : 'assets/images/start_dating_new.png',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
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
                          builder: (context) => LoginScreen(
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.lbl_start_dating,
                      style: Theme.of(context)
                          .textButtonTheme
                          .style!
                          .textStyle!
                          .resolve({
                        WidgetState.pressed,
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
