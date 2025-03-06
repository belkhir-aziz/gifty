import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends BaseRoute {
  const LoginScreen({super.key, super.a, super.o}) : super(r: 'LoginScreen');

  @override
  BaseRouteState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRouteState {
  final TextEditingController _cContactNo = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _LoginScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
    key: _scaffoldKey,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                AppLocalizations.of(context)!.lbl_login,
                style: Theme.of(context).primaryTextTheme.displayLarge,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.lbl_login_subtitle1,
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
            Text(
              AppLocalizations.of(context)!.lbl_login_subtitle2,
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.all(1.5),
              height: 55,
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
                height: 55,
                child: TextFormField(
                  style: Theme.of(context).primaryTextTheme.titleSmall,
                  controller: _cContactNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/flag1.png',
                              fit: BoxFit.fitWidth,
                              height: 15,
                            ),
                          ),
                          Text(
                            '(+01)',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleSmall,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.expand_more,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              thickness: 2,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 150,
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
                      builder: (context) => VerifyOtpScreen(
                            a: widget.analytics,
                            o: widget.observer,
                          )));
                },
                child: Text(
                  AppLocalizations.of(context)!.btn_submit,
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
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 0.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: g.gradientColors,
                      ),
                    ),
                    child: const Divider(),
                  ),
                  Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFF3F1444),
                        ),
                      ),
                      child: g.isDarkModeEnable
                          ? CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.black,
                              child: Text(
                                AppLocalizations.of(context)!.lbl_or,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
                              ),
                            )
                          : CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              child: Text(
                                AppLocalizations.of(context)!.lbl_or,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
                              ),
                            ))
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)!.lbl_login_using,
              style: Theme.of(context).primaryTextTheme.displaySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF2942C7),
                    child: Text(
                      'f',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: g.isRTL
                        ? const EdgeInsets.only(right: 15)
                        : const EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xFFDF4D5F),
                      child: Text(
                        'G',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

}
