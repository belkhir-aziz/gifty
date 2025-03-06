import 'package:datingapp/models/add_new_message_model.dart';
import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/chat_screen.dart';
import 'package:datingapp/screens/start_conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddMessageScreen extends BaseRoute {
  const AddMessageScreen({super.key, super.a, super.o}) : super(r: 'AddMessageScreen');

  @override
  BaseRouteState createState() => _AddMessageScreenState();
}

class _AddMessageScreenState extends BaseRouteState {
  final TextEditingController _cSearch = TextEditingController();

  final List<String> circleImageList = [
    'assets/images/img_circle_0.png',
    'assets/images/img_circle_1.png',
    'assets/images/img_circle_2.png',
    'assets/images/img_circle_0.png',
    'assets/images/img_circle_1.png',
    'assets/images/img_circle_2.png',
  ];

  final List<AddNewMessage> _addNewMsgList = [
    AddNewMessage(
        name: 'Belle Benson',
        time: '03:45 PM',
        imgPath: 'assets/images/card_img_0.png',
        messageCount: 2),
    AddNewMessage(
        name: 'Ruby Diaz',
        time: '11:49 AM',
        imgPath: 'assets/images/card_img_1.png',
        messageCount: 3),
    AddNewMessage(
        name: 'Myley Corbyon',
        time: 'Yesterday',
        imgPath: 'assets/images/card_img_2.png',
        messageCount: 1),
    AddNewMessage(
        name: 'Tony Z',
        time: '11:30 PM',
        imgPath: 'assets/images/card_img_1.png',
        messageCount: 0),
    AddNewMessage(
        name: 'Ruby Raman',
        time: 'Yesterday',
        imgPath: 'assets/images/card_img_4.png',
        messageCount: 1),
  ];

  _AddMessageScreenState();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(2),
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
                      color:
                          g.isDarkModeEnable ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    height: 55,
                    child: TextFormField(
                      controller: _cSearch,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: g.isRTL
                            ? const EdgeInsets.only(right: 22, top: 15)
                            : const EdgeInsets.only(left: 22, top: 15),
                        hintText: AppLocalizations.of(context)!
                            .hint_Searchlbl_Search_Message_match,
                        hintStyle:
                            Theme.of(context).primaryTextTheme.titleSmall,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.search),
                            color: Theme.of(context).iconTheme.color,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      AppLocalizations.of(context)!.lbl_New_Matches,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: circleImageList.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StartConversionScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: const Color(0xFFF1405B),
                                backgroundImage: AssetImage(
                                  circleImageList[index],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_All_Messages,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _addNewMsgList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: g.isDarkModeEnable
                                ? const Color(0xFF1D0529)
                                : Colors.white54,
                          ),
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(1.5),
                                  margin: g.isRTL
                                      ? const EdgeInsets.only(left: 10)
                                      : const EdgeInsets.only(right: 10),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(11),
                                      color: Colors.purple,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                      child: Image.asset(
                                        _addNewMsgList[index].imgPath!,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10),
                                          child: Text(
                                            '${_addNewMsgList[index].name}',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 10),
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Colors
                                                .lightGreenAccent[400],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Hi, How are you? Nice to meet\nyou? Free now, you?',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium,
                                    )
                                  ],
                                )
                              ],
                            ),
                            trailing: SizedBox(
                              height: 60,
                              width: 53,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${_addNewMsgList[index].time}',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodySmall,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: const Color(0xFFD6386F),
                                        child: Text(
                                          '2',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        a: widget.analytics,
                                        o: widget.observer,
                                      )));
                            },
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
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
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      child: IconButton(
                        icon: const Icon(MdiIcons.messageReplyTextOutline),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: g.isRTL
                          ? const EdgeInsets.only(right: 8)
                          : const EdgeInsets.only(left: 8),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_Add_new_message,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
