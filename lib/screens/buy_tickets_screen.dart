import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/payment_screen.dart';
import 'package:datingapp/screens/plan_dating_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyTicketsScreen extends BaseRoute {
  const BuyTicketsScreen({super.key, super.a, super.o}) : super(r: 'BuyTicketsScreen');

  @override
  BaseRouteState createState() => _BuyTicketsScreenState();
}

class _BuyTicketsScreenState extends BaseRouteState {
  _BuyTicketsScreenState() : super();

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
          appBar: _appBarWidget(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.5),
                        color: const Color.fromRGBO(19, 1, 51, 1),
                      ),
                      child: Image.asset(
                        'assets/images/event_detail.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF130032),
                      child: Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 26,
                      ),
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
                    color: const Color(0xFF130032),
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: 15,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF984cd9),
                          Color(0xFFb245af),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(
                                top: 20, right: 20, bottom: 12)
                            : const EdgeInsets.only(
                                top: 20, left: 20, bottom: 12),
                        child: Text(
                          'Grand Concert',
                          style:
                              Theme.of(context).primaryTextTheme.displayLarge,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: g.gradientColors,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(bounds);
                                  },
                                  child: const Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 4)
                                      : const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '9 May, 2021',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: g.gradientColors,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(bounds);
                                  },
                                  child: const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 4)
                                      : const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '10PM - 01AM',
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
                      Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 20, top: 30)
                            : const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          AppLocalizations.of(context)!.lbl_desc,
                          style:
                              Theme.of(context).primaryTextTheme.displaySmall,
                        ),
                      ),
                      Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 20, top: 10)
                            : const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Electronic concert will be held near Sabina',
                          style: Theme.of(context).primaryTextTheme.titleSmall,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                            child: Text(
                              'Beach park with dinner,mocktail',
                              style:
                                  Theme.of(context).primaryTextTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: g.gradientColors,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              child: const Text('More..'),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: g.isRTL
                            ? const EdgeInsets.only(right: 20, top: 20)
                            : const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          AppLocalizations.of(context)!.lbl_intrestes_viewers,
                          style:
                              Theme.of(context).primaryTextTheme.displaySmall,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      'assets/images/sample3.png',
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 40,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                        'assets/images/sample3.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 80,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                        'assets/images/sample3.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 120,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                        'assets/images/sample3.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 160,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                        'assets/images/sample3.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 200,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: const Color(0xFF130032),
                                      child: Text(
                                        '+237',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Align(
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
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => PaymentScreen(
                                              screenId: 1,
                                              a: widget.analytics,
                                              o: widget.observer,
                                            )));
                              },
                              child: Text(
                                AppLocalizations.of(context)!.btn_buy_tickets,
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

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65),
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
              icon: const Icon(FontAwesomeIcons.search),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: g.isRTL ? Alignment.centerRight : Alignment.centerLeft,
            color: const Color(0xFFCC3263),
            width: MediaQuery.of(context).size.width / 2 - 35,
            height: 65,
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlanDatingScreen(
                          a: widget.analytics,
                          o: widget.observer,
                        )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
