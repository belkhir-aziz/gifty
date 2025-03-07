import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/add_text_create_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateStoryScreen extends BaseRoute {
  const CreateStoryScreen({super.key, super.a, super.o}) : super(r: 'CreateStoryScreen');

  @override
  BaseRouteState createState() => _CreateStoryScreenState();
}

class _CreateStoryScreenState extends BaseRouteState {
  List<Asset> images = <Asset>[];
  String error = 'No Error Detected';

  _CreateStoryScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddTextCreateStory(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                            gradient: LinearGradient(
                              colors: g.gradientColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Text(
                                AppLocalizations.of(context)!.lbl_Aa,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        fontSize: 22,
                                        color: const Color(0xFF33196B),
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                AppLocalizations.of(context)!.lbl_Text,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        loadAssets();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          gradient: LinearGradient(
                            colors: g.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Icon(
                                Icons.photo_camera,
                                color: Color(0xFF33196B),
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                AppLocalizations.of(context)!.lbl_Media,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              images.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: GridView.count(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: List.generate(images.length, (index) {
                              Asset asset = images[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
                                  color: g.isDarkModeEnable
                                      ? const Color(0xFF1D0529)
                                      : Colors.white54,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  child: AssetThumb(
                                    asset: asset,
                                    width: 300,
                                    height: 300,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.btn_create,
                      style: Theme.of(context)
                          .textButtonTheme
                          .style!
                          .textStyle!
                          .resolve({
                        WidgetState.pressed,
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                'Create Story',
                style: Theme.of(context).primaryTextTheme.titleSmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
  /*  List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        materialOptions: const MaterialOptions(
          maxImages: 10,
          enableCamera: true,
          autoCloseOnSelectionLimit: false,
          actionBarColor: Color(0xFF14012E),
          actionBarTitle: "Select",
          allViewTitle: "All Photos",
          useDetailsView: true,
          selectCircleStrokeColor: Color(0xFF000000),
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      //_error = error;
    });*/
  }
}
