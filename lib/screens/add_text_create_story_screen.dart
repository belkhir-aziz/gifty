import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddTextCreateStory extends BaseRoute {
  const AddTextCreateStory({super.key, super.a, super.o}) : super(r: 'AddTextCreateStory');

  @override
  BaseRouteState createState() => _AddTextCreateStoryState();
}

class _AddTextCreateStoryState extends BaseRouteState {
  final TextEditingController _cText = TextEditingController();

  _AddTextCreateStoryState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: g.gradientColors,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Scaffold(
          appBar: _appBarWidget(),
          backgroundColor: Colors.transparent,
          body: Center(
            child: TextFormField(
              maxLines: 10,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
              controller: _cText,
              decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)!.lbl_hint_start_typing,
                  hintStyle: const TextStyle(
                    fontSize: 26,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: g.isRTL
                    ? const EdgeInsets.only(left: 6)
                    : const EdgeInsets.only(right: 6),
                child: Text(
                  AppLocalizations.of(context)!.lbl_done,
                  style: const TextStyle(color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
