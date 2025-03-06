import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  final dynamic analytics;
  final dynamic observer;
  final String? routeName;

  const Base({super.key, this.analytics, this.observer, this.routeName});

  @override
  BaseState createState() => BaseState();
}

class BaseState<T extends Base> extends State<T>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  BaseState();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();

  @override
  void initState() {
    super.initState();
  }

  Future exitAppDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: const Text(
                  "Exit app",
                  style: TextStyle(color: Color(0xFF33196B), fontSize: 16),
                ),
                content: const Text(
                  "Are you sure you want to exit app?",
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Color(0xFF33196B), fontSize: 14),
                    ),
                    onPressed: () async {
                      exit(0);
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      debugPrint('Exception - base.dart - exitAppDialog(): ${e.toString()}');
    }
  }
}
