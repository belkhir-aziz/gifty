import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StartConversionScreen extends BaseRoute {
  const StartConversionScreen({super.key, super.a, super.o})
      : super(r: 'StartConversionScreen');

  @override
  BaseRouteState createState() => _StartConversionScreenState();
}

class _StartConversionScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _StartConversionScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    g.isDarkModeEnable
                        ? 'assets/images/match_new_remove.png'
                        : 'assets/images/match_new_remove.png',
                    fit: BoxFit.fitWidth,
                  ),
                  Text(AppLocalizations.of(context)!.lbl_congrats,
                      style: Theme.of(context).primaryTextTheme.displayLarge),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.lbl_its_match,
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                    ),
                  ),
                  Text('Belle and You both Liked each other',
                      style: Theme.of(context).primaryTextTheme.titleSmall),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatScreen(
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            iconSize: 0,
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              MdiIcons.messageReplyTextOutline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            AppLocalizations.of(context)!.lbl_coversation,
                            style: TextStyle(
                              color: g.isDarkModeEnable
                                  ? Colors.yellow[700]
                                  : Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20, bottom: 20, right: 10),
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: g.gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            overlayColor:
                                WidgetStateProperty.all(Colors.transparent),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              AppLocalizations.of(context)!.lbl_keep_dating,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
