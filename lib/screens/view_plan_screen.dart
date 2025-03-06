import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/plan_dating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewPlanScreen extends BaseRoute {
  const ViewPlanScreen({super.key, super.a, super.o}) : super(r: 'ViewPlanScreen');

  @override
  BaseRouteState createState() => _ViewPlanScreenState();
}

class _ViewPlanScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _ViewPlanScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
          canPop: true,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    g.isDarkModeEnable
                        ? 'assets/images/subscription_dark.png'
                        : 'assets/images/subscription_light.png',
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.lbl_hello_user,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'To continue with this option please\nchoose a subsciption plan that suits\nyou & get the most out of the app',
                    style: Theme.of(context).primaryTextTheme.titleSmall,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PlanDatingScreen(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                      child: Text(AppLocalizations.of(context)!.btn_view_plan,
                          style: Theme.of(context)
                              .textButtonTheme
                              .style!
                              .textStyle!
                              .resolve({
                            WidgetState.pressed,
                          })),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

}
