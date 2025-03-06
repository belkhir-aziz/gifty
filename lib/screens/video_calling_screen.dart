import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VideoCallingScreen extends BaseRoute {
  const VideoCallingScreen({super.key, super.a, super.o}) : super(r: 'VideoCallingScreen');

  @override
  BaseRouteState createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<IconData> iconList = [
    Icons.upload_file,
    MdiIcons.messageReplyTextOutline,
    Icons.refresh,
    Icons.voice_over_off,
  ];
  var _bottomNavIndex = 0;

  _VideoCallingScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      g.isDarkModeEnable
                          ? 'assets/images/video img_dark.png'
                          : 'assets/images/video img_light.png',
                      height: MediaQuery.of(context).size.height - 24,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF230f4E),
                          ),
                          margin: g.isRTL
                              ? const EdgeInsets.only(right: 20)
                              : const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 4)
                                    : const EdgeInsets.only(left: 4),
                                child: Text(
                                  'Matched',
                                  style: TextStyle(
                                      color: g.isDarkModeEnable
                                          ? Colors.yellow[700]
                                          : Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, bottom: 3),
                                child: Image.asset(
                                  'assets/images/heart.png',
                                  height: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 20)
                              : const EdgeInsets.only(left: 20),
                          child: Text(
                            'Sara Christin',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: g.isRTL
                              ? const EdgeInsets.only(right: 20, top: 20, bottom: 20)
                              : const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable
                                ? Colors.black38
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 6,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                ),
                              ),
                              Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(right: 4)
                                    : const EdgeInsets.only(left: 4),
                                child: const Text(
                                  '27:15',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: g.isRTL
                          ? const EdgeInsets.only(left: 20, bottom: 20)
                          : const EdgeInsets.only(right: 20, bottom: 20),
                      padding: const EdgeInsets.all(1.2),
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/sample1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: g.isDarkModeEnable ? null : Colors.black,
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
            ),
          ),
          child: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      iconList[index],
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              );
            },
            splashRadius: 0,
            elevation: 0,
            backgroundColor: const Color(0xFF230f4E),
            activeIndex: _bottomNavIndex,
            notchSmoothness: NotchSmoothness.softEdge,
            gapLocation: GapLocation.center,
            onTap: (index) => setState(() => _bottomNavIndex = index),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffD6376E),
                Color(0xFFAD45B3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor:
                g.isDarkModeEnable ? const Color(0xFFFA692C) : Colors.transparent,
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
