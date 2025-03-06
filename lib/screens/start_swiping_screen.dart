import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartSwipingScreen extends BaseRoute {
  const StartSwipingScreen({super.key, super.a, super.o}) : super(r: 'StartSwippingScreen');

  @override
  BaseRouteState createState() => _StartSwipingScreenState();
}

class _StartSwipingScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _StartSwipingScreenState();

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
                        ? 'assets/images/unmatch_new_remove.png'
                        : 'assets/images/unmatch_new_remove.png',
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.lbl_be_patient,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_dont_loose,
                    style: Theme.of(context).primaryTextTheme.titleSmall,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.lbl_find_your_best,
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
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
                          AppLocalizations.of(context)!.lbl_start_swipping,
                          style: const TextStyle(fontSize: 22),
                        )),
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
