import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:story_view/story_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewStoryScreen extends BaseRoute {
  const ViewStoryScreen({super.key, super.a, super.o}) : super(r: 'ViewStoryScreen');

  @override
  BaseRouteState createState() => _ViewStoryScreenState();
}

class _ViewStoryScreenState extends BaseRouteState {
  List<StoryItem> storyItems = [
    StoryItem.pageProviderImage(
      const AssetImage(
        'assets/images/view1.png',
      ),
      imageFit: BoxFit.fitWidth,
      duration: const Duration(seconds: 30),
    ),
    StoryItem.pageProviderImage(
      const AssetImage(
        'assets/images/view2.png',
      ),
      imageFit: BoxFit.fitWidth,
      duration: const Duration(seconds: 30),
    ),
    StoryItem.pageProviderImage(
      const AssetImage(
        'assets/images/view3.png',
      ),
      imageFit: BoxFit.fitWidth,
      duration: const Duration(seconds: 30),
    ),
  ];

  _ViewStoryScreenState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: g.scaffoldBackgroundGradientColors,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: g.isDarkModeEnable
                ? const Color(0xFF03000C)
                : Theme.of(context).scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 24,
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 24,
                          width: MediaQuery.of(context).size.width,
                          child: StoryView(
                              inline: true,
                              storyItems: storyItems,
                              controller: StoryController(),
                              // pass controller here too
                              repeat: false,
                              // should the stories be slid forever
                              onStoryShow: (s, i) {},
                              onComplete: () {
                                Navigator.of(context).pop();
                              },
                              onVerticalSwipeComplete: (direction) {}),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon:
                                        const Icon(FontAwesomeIcons.longArrowAltLeft),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CircleAvatar(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_circle_0.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Belle Benson',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                            ),
                                            Text(
                                              '5 hours ago',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomSheet: BottomAppBar(
              color: g.isDarkModeEnable
                  ? const Color(0xFF14012F)
                  : Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                        //controller: _cMessage,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText:
                              AppLocalizations.of(context)!.lbl_reply_hint,
                          hintStyle:
                              Theme.of(context).primaryTextTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.emoticonHappy,
                      size: 20,
                    ),
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
