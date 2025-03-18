import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/screens/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerifyOtpScreen extends BaseRoute {
  const VerifyOtpScreen({super.key, super.a, super.o}) : super(r: 'VerifyOtpScreen');

  @override
  BaseRouteState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _fNum2 = FocusNode();
  final FocusNode _fNum3 = FocusNode();
  final FocusNode _fNum4 = FocusNode();

  _VerifyOtpScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  AppLocalizations.of(context)!.lbl_verify,
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.lbl_4_digit_entre,
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
              Text(
                AppLocalizations.of(context)!.lbl_sent_to_num,
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      padding: const EdgeInsets.all(1.2),
                      height: 55,
                      width: 55,
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
                        width: 55,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(_fNum2);
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      padding: const EdgeInsets.all(1.2),
                      height: 55,
                      width: 55,
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
                        width: 55,
                        child: TextFormField(
                          focusNode: _fNum2,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(_fNum3);
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      padding: const EdgeInsets.all(1.2),
                      height: 55,
                      width: 55,
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
                        width: 55,
                        child: TextFormField(
                          focusNode: _fNum3,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(_fNum4);
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      padding: const EdgeInsets.all(1.2),
                      height: 55,
                      width: 55,
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
                        width: 55,
                        child: TextFormField(
                          focusNode: _fNum4,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                        ),
                      ),
                    ),
                  ],
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
                        builder: (context) => ProfileDetailScreen(
                              a: widget.analytics,
                              o: widget.observer,
                              userProfile: new UserProfile(id: "", email: "", firstName: "", lastName: "", gender: "", dateOfBirth: DateTime.now(), hobbies: ""),
                              isUpdate: false,
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
                padding: const EdgeInsets.all(20.0),
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
                    AppLocalizations.of(context)!.lbl_resend_otp,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
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
