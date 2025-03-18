import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/screens/likes_and_interest_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_dark.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileDetailScreen extends BaseRoute {
  final bool isUpdate;
  final UserProfile userProfile; 
  const ProfileDetailScreen({super.key, super.a, super.o, required  this.userProfile, required  this.isUpdate}) : super(r: 'ProfileDetailScreen');

  @override
  BaseRouteState createState() => _ProfileDetailScreenState(userProfile,isUpdate);
}

class _ProfileDetailScreenState extends BaseRouteState {
  final bool isUpdate; // Toggle between Edit Profile and Sign-Up modes
  final UserProfile userProfile; // Store UserProfile in state
  final UserProfileHandler userProfileHandler = UserProfileHandler();
  final TextEditingController _cFirstName = TextEditingController();
  final TextEditingController _cLastName = TextEditingController();
  final TextEditingController _cBDate = TextEditingController();
  final TextEditingController _cGender = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _bDateFocusNode = FocusNode();
  String? _gender;
 


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProvider userProvider;
  _ProfileDetailScreenState(this.userProfile, this.isUpdate) : super();
  


  void updateProfileUser() {
    // Update the profileUser object with the current input
    if (isUpdate && (_cFirstName.text.isEmpty || _cFirstName.text == '')) {
      userProfile.firstName = userProvider.userProfile!.firstName;
    } else {
      userProfile.firstName = _cFirstName.text;
    }
    if (isUpdate && (_cLastName.text.isEmpty || _cLastName.text == '')) {
      userProfile.lastName = userProvider.userProfile!.lastName;
    } else {
      userProfile.lastName = _cLastName.text;
    }
    if (isUpdate && (_cBDate.text.isEmpty || _cBDate.text == '')) {
      userProfile.dateOfBirth = userProvider.userProfile!.dateOfBirth;
    } else {
      userProfile.dateOfBirth = DateFormat("dd-MM-yyyy").parse(_cBDate.text);
    }
    if (isUpdate && (_cGender.text.isEmpty || _cGender.text == '')) {
      userProfile.gender = userProvider.userProfile!.gender;
    } else {
      userProfile.gender = _cGender.text;
    }
    
  }
  @override
  void initState() {
    super.initState();
    _cFirstName.addListener(_updateState);
    _cLastName.addListener(_updateState);
    _cBDate.addListener(_updateState);
    _firstNameFocusNode.addListener(_updateState);
    _lastNameFocusNode.addListener(_updateState);
    _bDateFocusNode.addListener(_updateState);
  }

  @override
  void dispose() {
    _cFirstName.dispose();
    _cLastName.dispose();
    _cBDate.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _bDateFocusNode.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    _gender = isUpdate? '${userProvider.userProfile?.gender}'
                        : 'Select Gender';
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: _appBarWidget(),
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
                          focusNode: _firstNameFocusNode,
                          decoration: InputDecoration(
                            labelText:
                            (_firstNameFocusNode.hasFocus || _cFirstName.text.isNotEmpty)
                                ? null
                                : (isUpdate
                                  ? '${userProvider.userProfile?.firstName}'
                                  : AppLocalizations.of(context)!.lbl_first_name_hint), 

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
                          focusNode: _lastNameFocusNode,
                          decoration: InputDecoration(
                            labelText:
                            (_lastNameFocusNode.hasFocus || _cLastName.text.isNotEmpty)
                                ? null
                                : (isUpdate
                                  ? '${userProvider.userProfile?.lastName}'
                                  : AppLocalizations.of(context)!.lbl_last_name_hint), // Adjust the title dynamically

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
                          focusNode: _bDateFocusNode,
                          readOnly: true, // Prevent keyboard input to allow only date selection
                          decoration: InputDecoration(
                            labelText:
                            (_bDateFocusNode.hasFocus || _cBDate.text.isNotEmpty)
                                ? null
                                : (isUpdate
                                  ? '${DateFormat('yyyy-MM-dd').format(userProvider.userProfile!.dateOfBirth.toLocal())}'
                                  : AppLocalizations.of(context)!.lbl_dob_hint), 


                            labelStyle: Theme.of(context).primaryTextTheme.titleSmall,
                            contentPadding: _cBDate.text.isNotEmpty
                            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 15) // Adjust padding when date is set
                            : g.isRTL
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(left: 20),
                            alignLabelWithHint: true, // Ensure label text aligns with hint text    
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                // Open date picker
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), // Current date
                                  firstDate: DateTime(1900),   // Earliest selectable date
                                  lastDate: DateTime.now(),   // Latest selectable date
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(   
                                        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                                          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary), // "Enter Date" label color
                                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary), // Hint text color
                                        ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white, // Text color of the buttons
                                        backgroundColor: Colors.purple, // Background color of the buttons
                                      ),
                                    ),
                                  ),
                                      child: child!,                                    
                                    );
                                  },
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
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                          dropdownColor: Theme.of(context).scaffoldBackgroundColor,  //Theme.of(context).primaryColorLight,
                          icon: Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(left: 20)
                                : const EdgeInsets.only(right: 20),
                            child: Icon(Icons.expand_more,
                                color: Theme.of(context).iconTheme.color),
                          ),
                          value: _gender,
                          items: ['Select Gender', 'male', 'female']
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
                              setState(() {
                                
                                  _gender = value;
                                  _cGender.text = _gender!;
                              });
                              
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
                            isUpdate
                            ? 
                            (userProfileHandler.editUserProfile(userProfile),
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomNavigationWidgetLight(
                                currentIndex: 2,
                                a: widget.analytics,
                                o: widget.observer,
                              ))))
                            : Navigator.of(context).push(MaterialPageRoute(
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


PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {
                    g.isDarkModeEnable
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavigationWidgetDark(
                                  currentIndex: 2,
                                  a: widget.analytics,
                                  o: widget.observer,
                                )))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavigationWidgetLight(
                                  currentIndex: 2,
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                  },
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}