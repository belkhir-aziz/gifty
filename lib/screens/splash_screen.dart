import 'dart:async';

import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/provider/local_provider.dart';
import 'package:datingapp/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends BaseRoute {
  const SplashScreen({super.key, super.a, super.o}) : super(r: 'SplashScreen');

  @override
  BaseRouteState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _SplashScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            g.isDarkModeEnable ? 'assets/images/splash_new_dark.jpg' : 'assets/images/splash_new_light.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();

    startTime();
  }

  startTime() {
    try {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IntroScreen()));
      });
    } catch (e) {
      debugPrint('Exception SplashScreen.dart - startTime() ${e.toString()}');
    }
  }

  _init() {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final provider = Provider.of<LocaleProvider>(context, listen: false);
        if (g.languageCode == null) {
          var locale = provider.locale ?? const Locale('en');
          g.languageCode = locale.languageCode;
        } else {
          provider.setLocale(Locale(g.languageCode!));
        }
        if (g.rtlLanguageCodeLList.contains(g.languageCode)) {
          g.isRTL = true;
        } else {
          g.isRTL = false;
        }
      });
    } catch (e) {
      debugPrint('Exception SplashScreen.dart - _init() ${e.toString()}');
    }
  }
}
