import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/screens/likes_and_interest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ProfileDetailScreen extends BaseRoute {
  final UserProfile userProfile; 
  const ProfileDetailScreen({super.key, super.a, super.o, required  this.userProfile}) : super(r: 'ProfileDetailScreen');

  @override
  BaseRouteState createState() => _ProfileDetailScreenState(userProfile);
}

class _ProfileDetailScreenState extends BaseRouteState {
  final UserProfile userProfile; // Store UserProfile in state

  final TextEditingController _cFirstName = TextEditingController();
  final TextEditingController _cLastName = TextEditingController();
  final TextEditingController _cBDate = TextEditingController();
  String? _gender = 'Select Gender';

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _ProfileDetailScreenState(this.userProfile) : super();

  void updateProfileUser() {
    // Update the profileUser object with the current input
    userProfile.firstName =_cFirstName.text;
    userProfile.lastName = _cLastName.text;
    userProfile.dateOfBirth = DateFormat("dd-MM-yyyy").parse(_cBDate.text);
    userProfile.gender = "male";
  }
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.lbl_profile_details,
                      style: Theme.of(context).primaryTextTheme.displayLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        AppLocalizations.of(context)!
                            .lbl_profile_details_subtitle,
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 63,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/sample4.png'),
                              radius: 60,
                              backgroundColor: Color(0xFF33196B),
                            ),
                          ),
                          Positioned(
                            top: 96,
                            left: 96,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: g.isDarkModeEnable
                                    ? Border.all(color: Colors.black)
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: g.gradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 20,
                                child: Icon(
                                  Icons.photo_camera,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                          controller: _cFirstName,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .lbl_first_name_hint,
                            labelStyle:
                                Theme.of(context).primaryTextTheme.titleSmall,
                            contentPadding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                          style:
                              Theme.of(context).primaryTextTheme.titleSmall,
                          controller: _cLastName,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .lbl_last_name_hint,
                            labelStyle:
                                Theme.of(context).primaryTextTheme.titleSmall,
                            contentPadding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                          controller: _cBDate,
                          readOnly: true, // Prevent keyboard input to allow only date selection
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.lbl_dob_hint,
                            labelStyle: Theme.of(context).primaryTextTheme.titleSmall,
                            contentPadding: g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                // Open date picker
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), // Current date
                                  firstDate: DateTime(1900),   // Earliest selectable date
                                  lastDate: DateTime.now(),   // Latest selectable date
                                );

                                if (pickedDate != null) {
                                  // Format the selected date
                                  String formattedDate =
                                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";

                                  // Update the TextEditingController with the selected date
                                  setState(() {
                                    _cBDate.text = formattedDate;
                                  });
                                }
                              },
                              child: Padding(
                                padding: g.isRTL
                                    ? const EdgeInsets.only(left: 4)
                                    : const EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Theme.of(context).scaffoldBackgroundColor,  //Theme.of(context).primaryColorLight,
                          icon: Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(left: 20)
                                : const EdgeInsets.only(right: 20),
                            child: Icon(Icons.expand_more,
                                color: Theme.of(context).iconTheme.color),
                          ),
                          value: _gender,
                          items: ['Select Gender', 'Women', 'Men']
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
                            child: Text(_gender!.isEmpty
                                ? AppLocalizations.of(context)!
                                    .lbl_gender_hint
                                : _gender!),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
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
                            updateProfileUser();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LikesInterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                      userProfile: userProfile
                                    )));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.btn_continue,
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

}
