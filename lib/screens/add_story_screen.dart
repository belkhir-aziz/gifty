import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/filter_options_screen.dart';
import 'package:datingapp/screens/notification_list_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tcard/tcard.dart';

class AddStoryScreen extends BaseRoute {
  const AddStoryScreen({super.key, super.a, super.o}) : super(r: 'AddStoryScreen');

  @override
  BaseRouteState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends BaseRouteState {
  final TCardController _controller = TCardController();
  int? _leftDirection;
  int? _rightDirection;

  final List<String> _imgList = [
    'assets/images/card_new_img.jpg',
    'assets/images/video img_light.png',
    'assets/images/video img_dark.png',
    'assets/images/videoCall.jpg',
    'assets/images/sample3.png',
  ];
  int _current = 0;

  _AddStoryScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: g.isDarkModeEnable
            ? const Color(0xFF03000C)
            : Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 18, left: 10, right: 10),
                            height:
                                MediaQuery.of(context).size.height * 0.53,
                            //MediaQuery.of(context).size.height * 0.54,
                            width: MediaQuery.of(context).size.width * 0.80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(g.isDarkModeEnable
                                    ? 'assets/images/cards_dark.png'
                                    : 'assets/images/cards_light.png'),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.70,
                                width: MediaQuery.of(context).size.width *
                                    0.75,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Listener(
                                    onPointerMove:
                                        (PointerMoveEvent event) {
                                      if (event.delta.dy > 0) {
                                        setState(() {
                                          _leftDirection = 1;
                                          _rightDirection = null;
                                        });
                                      }
                                      if (event.delta.dx > 0) {
                                        setState(() {
                                          _rightDirection = 2;
                                          _leftDirection = null;
                                        });
                                      }
                                    },
                                    child: TCard(
                                      cards: _widgets(),
                                      controller: _controller,
                                      onForward: (index, info) {
                                        if (info.direction ==
                                            SwipDirection.Left) {
                                          setState(() {
                                            _current = index;
                                            _leftDirection = 0;
                                            _rightDirection = 0;
                                          });
                                        }
                                        if (info.direction ==
                                            SwipDirection.Right) {
                                          setState(() {
                                            _current = index;
                                            _leftDirection = 0;
                                            _rightDirection = 0;
                                          });
                                        }
                                      },
                                      onEnd: () {
                                        _controller.reset();
                                        _current = 0;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFF230f4E),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.bug_report,
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            alignment: Alignment.bottomLeft,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                            _imgList[_current],
                                          ),
                                          radius: 32,
                                        ),
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(
                                                right: 6)
                                            : const EdgeInsets.only(
                                                left: 6),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Anna\nMcconaughey\n',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall
                                                    ?.copyWith(
                                                        fontSize: 19,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight
                                                                .w400),
                                              ),
                                              TextSpan(
                                                text: '1.5 km away',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color:
                                                            Colors.white70,
                                                        fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      child: Container(
                                        height: 50,
                                        padding: const EdgeInsets.only(left: 8),
                                        child: DotsIndicator(
                                          dotsCount: _imgList.length,
                                          position: _current.toDouble(),
                                          decorator: DotsDecorator(
                                            spacing: const EdgeInsets.all(3),
                                            color: Colors.transparent,
                                            activeColor: Colors.white,
                                            activeShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5.0),
                                              side: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5.0),
                                              side: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          MdiIcons.messageReplyTextOutline),
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.forward(
                                direction: SwipDirection.Right);
                          },
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF34F07F),
                            radius: 24,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: _leftDirection == 1
                                  ? const Color(0xFF34F07F)
                                  : Colors.white,
                              child: Icon(
                                Icons.thumb_up,
                                color: _leftDirection == 1
                                    ? Colors.white
                                    : const Color(0xFF34F07F),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFBC7D),
                                Color(0xFFEF5533),
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.forward(
                                direction: SwipDirection.Left);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFF0384F),
                              radius: 24,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: _rightDirection == 2
                                    ? const Color(0xFFF0384F)
                                    : Colors.white,
                                child: Icon(
                                  Icons.thumb_down,
                                  color: _rightDirection == 2
                                      ? Colors.white
                                      : const Color(0xFFF0384F),
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2285FA),
                                Color(0xFF1B40C1),
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              MdiIcons.informationVariant,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }


  _widgets() {
    List<Widget> widgetList = [];
    for (int i = 0; i < _imgList.length; i++) {
      widgetList.add(
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _imgList[i],
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70 - 1.5,
              width: MediaQuery.of(context).size.width * 0.75 - 1.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return widgetList;
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        'Send Invitation',
                                        style: Theme.of(context).primaryTextTheme.displayLarge,
                                      ),
                                    ),
                                    TextFormField(
                                      controller: TextEditingController(),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(20),
                                        hintText: 'Enter recipient email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Theme.of(context).iconTheme.color,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
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
                                          // Handle send invitation logic here
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Send Invitation',
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
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                                            },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 8)
                          : const EdgeInsets.only(left: 8),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_Add_Story,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: const Icon(Icons.notifications_rounded),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotificationListScreen(
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                        },
                      ),
                    ),
                    IconButton(
                      icon: (const Icon(MdiIcons.tuneVerticalVariant)),
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FilterOptionsScreen(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
