import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationListScreen extends BaseRoute {
  const NotificationListScreen({super.key, super.a, super.o})
      : super(r: 'NotificationListScreen');

  @override
  BaseRouteState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _NotificationListScreenState() : super();

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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.lbl_notifications,
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 20),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_notifications_subtitle,
                    style: Theme.of(context).primaryTextTheme.titleSmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 31,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/sample2.png',
                                    ),
                                    backgroundColor: Colors.transparent,
                                    radius: 30,
                                  ),
                                ),
                                Padding(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 12)
                                      : const EdgeInsets.only(left: 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Myley Corbyn liked you',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleMedium,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 4),
                                        child: Text(
                                          'Hi Mathew, Myley here.\nWould you like to chat? waiting..',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      Text(
                                        '12:20 AM | 29.04.2022',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: g.gradientColors,
                              ),
                            ),
                            child: const Divider(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
