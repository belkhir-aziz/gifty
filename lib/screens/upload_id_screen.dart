import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/location_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UploadIdScreen extends BaseRoute {
  const UploadIdScreen({super.key, super.a, super.o})
      : super(r: 'UploadIdScreen');

  @override
  BaseRouteState createState() => _UploadIdScreenState();
}

class _UploadIdScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _ages = 'ID Proof';

  _UploadIdScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent),
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.lbl_upload_id,
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    'We strongly give full freedom to our\nusers, but to avoid any kind of mishap\n& nuisance we recommended you to\nprovide a ID proof for safety & security',
                    style: Theme.of(context).primaryTextTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20),
                  padding: const EdgeInsets.all(1.2),
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
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: g.isDarkModeEnable
                          ? Colors.black
                          : Theme.of(context).scaffoldBackgroundColor,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: g.isDarkModeEnable
                              ? const Color(0xFF03000C)
                              : Theme.of(context).scaffoldBackgroundColor,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.expand_more,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          value: _ages,
                          items: ['ID Proof', 'Bio data']
                              .map((label) => DropdownMenuItem(
                                    value: label,
                                    child: Padding(
                                      padding: g.isRTL
                                          ? const EdgeInsets.only(right: 20)
                                          : const EdgeInsets.only(left: 20),
                                      child: Text(
                                        label.toString(),
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          hint: Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                            child: Text(
                              _ages!.isNotEmpty ? _ages! : 'ID Proof',
                              style:
                                  Theme.of(context).primaryTextTheme.titleSmall,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _ages = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: const Color.fromRGBO(134, 34, 84, 1),
                  radius: const Radius.circular(30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: g.isDarkModeEnable
                          ? Colors.black
                          : Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            const Icon(
                              MdiIcons.fileDocument,
                              color: Color(0xFF4C407B),
                              size: 80,
                            ),
                            Positioned(
                              top: 65,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: const Color(0xFF4C407B),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: g.isDarkModeEnable
                                      ? Colors.black
                                      : Theme.of(context)
                                          .scaffoldBackgroundColor,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
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
                              AppLocalizations.of(context)!.lbl_upload_doc,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 10),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LocationScreen(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
