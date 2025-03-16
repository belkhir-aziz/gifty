import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterOptionsScreen extends BaseRoute {
  const FilterOptionsScreen({super.key, super.a, super.o}) : super(r: 'FilterOptionsScreen');

  @override
  BaseRouteState createState() => _FilterOptionsScreenState();
}

class _FilterOptionsScreenState extends BaseRouteState {
  final TextEditingController _cLocation = TextEditingController();
  double values = 0;
  String? _ratingController = "English, French, Bengali";
  String? _here = 'Make New Friends';
  String? _want = 'Women';
  String? _ages = "20-35";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _FilterOptionsScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: g.scaffoldBackgroundGradientColors,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Scaffold(
          appBar: _appBarWidget(),
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.lbl_filter_options,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).primaryTextTheme.displayLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        AppLocalizations.of(context)!
                            .lbl_filter_options_subtitle,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_here_to,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0xFFEF3A6A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
                            value: _here,
                            items: ['Make New Friends', 'Matches']
                                .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                _here!.isNotEmpty ? _here! : 'Make New Friends',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _here = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_want_to_meet,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0xFFEF3A6A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
                              child: Icon(Icons.expand_more,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                            value: _want,
                            items: ['Women', 'Men']
                                .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(_want!.isEmpty ? 'Women' : _want!),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _want = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_prefer_age_range,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0xFFEF3A6A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
                            items: ['20-35', '18-12']
                                .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                _ages!.isNotEmpty ? _ages! : '20-35',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_prefer_language,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0xFFEF3A6A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
                            value: _ratingController,
                            items: [
                              'English, French, Bengali',
                              'Hindi, Gujarati, Marathi'
                            ]
                                .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                _ratingController!.isNotEmpty
                                    ? _ratingController!
                                    : 'English, French, Bengali',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _ratingController = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.lbl_location,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0xFFEF3A6A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable
                                ? Colors.black
                                : Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          height: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              controller: _cLocation,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.place,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 20, top: 15),
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall,
                                hintText: 'Florida, US',
                              ),
                            ),
                          )),
                    ),
                    g.isDarkModeEnable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.lbl_distance_range,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: const Color(0xFFEF3A6A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .lbl_distance_range,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: const Color(0xFFEF3A6A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '0 - ${values.round()} km',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: const Color(0xFFDD3663)),
                                ),
                              ],
                            ),
                          ),
                    g.isDarkModeEnable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '0 - ${values.round()} km',
                              style:
                                  Theme.of(context).primaryTextTheme.titleSmall,
                            ),
                          )
                        : const SizedBox(),
                    Slider(
                        activeColor: const Color.fromRGBO(246, 74, 105, 1),
                        inactiveColor: const Color.fromRGBO(35, 4, 254, 0.3),
                        min: 0,
                        max: 100,
                        value: values,
                        onChanged: (value) {
                          setState(() {
                            values = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ShaderMask(
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
                                  .lbl_advance_filter_options,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              FontAwesomeIcons.longArrowAltRight,
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.all(20),
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
                          child: Text(
                            AppLocalizations.of(context)!.btn_apply_filters,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListTile(
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              trailing: Icon(
                Icons.refresh,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
