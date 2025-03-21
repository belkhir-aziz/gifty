import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/widgets/bottom_navigation_bar_widget_dark.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends BaseRoute {
  const LocationScreen({super.key, super.a, super.o}) : super(r: 'LocationScreen');

  @override
  BaseRouteState createState() => _LocationScreenState();
}

class _LocationScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _cLocation = TextEditingController();
  final TextEditingController _cNewLocation = TextEditingController();

  _LocationScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Text(AppLocalizations.of(context)!.lbl_location,
                  style: Theme.of(context).primaryTextTheme.displayLarge),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!.lbl_location_subtitle1,
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                ),
              ),
              Text(AppLocalizations.of(context)!.lbl_location_subtitle2,
                  style: Theme.of(context).primaryTextTheme.titleSmall),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_current_location,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                            color: const Color(0xFFEF3A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(1.2),
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: g.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: g.isDarkModeEnable
                        ? Colors.black
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    textAlign: TextAlign.start,
                    controller: _cLocation,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(left: 20)
                            : const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.my_location,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      contentPadding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 15)
                          : const EdgeInsets.only(left: 20, top: 15),
                      hintStyle:
                          Theme.of(context).primaryTextTheme.titleSmall,
                      hintText: 'Florida, US',
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(1.2),
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: g.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: g.isDarkModeEnable
                        ? Colors.black
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    textAlign: TextAlign.start,
                    controller: _cNewLocation,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(left: 20)
                            : const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      contentPadding: g.isRTL
                          ? const EdgeInsets.only(right: 20, top: 15)
                          : const EdgeInsets.only(left: 20, top: 15),
                      hintStyle:
                          Theme.of(context).primaryTextTheme.titleSmall,
                      hintText: AppLocalizations.of(context)!
                          .lbl_search_location_hint,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
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
                      g.isDarkModeEnable
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetDark(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                    },
                    child: Text(AppLocalizations.of(context)!.btn_continue,
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
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.lbl_powered_by,
                        style:
                            Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, top: 4),
                        child: Image.asset(
                          'assets/images/google_back.png',
                          height: 25,
                          width: 70,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
