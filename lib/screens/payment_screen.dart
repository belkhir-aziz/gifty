import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/dating_matching_screen.dart';
import 'package:datingapp/screens/select_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends BaseRoute {
  final int? screenId;

  const PaymentScreen({super.key, super.a, super.o, this.screenId}) : super(r: 'PaymentScreen');

  @override
  BaseRouteState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends BaseRouteState<PaymentScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int? _selected = 0;

  _PaymentScreenState();

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SelectPlanScreen(
                        a: widget.analytics,
                        o: widget.observer,
                      )));
            },
          ),
        ),
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.lbl_payment,
                    style: Theme.of(context).primaryTextTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      AppLocalizations.of(context)!.lbl_payment_subtitle1,
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      AppLocalizations.of(context)!.lbl_payment_subtitle2,
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        child: RadioListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.all(0),
                          tileColor: Colors.transparent,
                          activeColor: g.isDarkModeEnable
                              ? Colors.white
                              : Theme.of(context).primaryColorLight,
                          subtitle: Text(
                            '**** **** **** 5229',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFF33196B),
                                    fontWeight: FontWeight.w400),
                          ),
                          value: 0,
                          groupValue: _selected,
                          title: Text('HDFC Credit Card',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium),
                          onChanged: (int? value) {
                            setState(() {
                              _selected = value;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/master_remove.png',
                        height: 50,
                        width: 60,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        child: RadioListTile(
                          tileColor: Colors.transparent,
                          dense: true,
                          contentPadding: const EdgeInsets.all(0),
                          activeColor: g.isDarkModeEnable
                              ? Colors.white
                              : Theme.of(context).primaryColorLight,
                          subtitle: Text(
                            '**** **** **** 4421',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xFF33196B),
                                    fontWeight: FontWeight.w400),
                          ),
                          value: 1,
                          groupValue: _selected,
                          title: Text('ICICI Credit Card',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium),
                          onChanged: (int? value) {
                            setState(() {
                              _selected = value;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/visa_remove.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: g.isDarkModeEnable ? 1.5 : 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: g.gradientColors,
                        ),
                      ),
                      child: const Divider(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'UPI Payment',
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                        Text(
                          'Linked',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: g.isDarkModeEnable ? 1.5 : 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: g.gradientColors,
                        ),
                      ),
                      child: const Divider(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PayTM / Wallets',
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: g.isDarkModeEnable ? 1.5 : 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: g.gradientColors,
                        ),
                      ),
                      child: const Divider(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Net Banking',
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/add icon.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
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
                        AppLocalizations.of(context)!
                            .lbl_add_new_payment_options,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
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
                          widget.screenId == 2
                              ? Navigator.of(context).pop()
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DatingMatchesScreen(
                                        a: widget.analytics,
                                        o: widget.observer,
                                      )));
                        },
                        child: Text(AppLocalizations.of(context)!.btn_pay_now,
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
      ),
    ));
  }

}
