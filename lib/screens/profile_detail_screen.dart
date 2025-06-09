import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/screens/likes_and_interest_screen.dart';
import 'package:datingapp/screens/notification_banner_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _cCountry = TextEditingController();
  final TextEditingController _cBDate = TextEditingController();
  final TextEditingController _cGender = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _bDateFocusNode = FocusNode();
  String? _gender;
  String? _country;
 


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProvider userProvider;
  _ProfileDetailScreenState(this.userProfile, this.isUpdate) : super();
  

void _showNotification(String message, {bool isError = false}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FancyNotificationBanner(
        message: message,
        isError: isError,
        icon: isError ? Icons.error_outline : Icons.check_circle_outline,
      );
    },
  );}
bool updateProfileUser() {
  String errorMessage = '';

  // Update the profileUser object with the current input
  if (isUpdate && (_cFirstName.text.isEmpty || _cFirstName.text == '')) {
    userProfile.firstName = userProvider.userProfile!.firstName;
  } else {
    userProfile.firstName = _cFirstName.text.trim();
  }

  if (isUpdate && (_cLastName.text.isEmpty || _cLastName.text == '')) {
    userProfile.lastName = userProvider.userProfile!.lastName;
  } else {
    userProfile.lastName = _cLastName.text.trim();
  }

  if (isUpdate && (_cBDate.text.isEmpty || _cBDate.text == '')) {
    userProfile.dateOfBirth = userProvider.userProfile!.dateOfBirth;
  } else {
    try {
      userProfile.dateOfBirth = DateFormat("dd-MM-yyyy").parse(_cBDate.text);
    } catch (e) {
      errorMessage = 'Invalid date format';
    }
  }

  if (isUpdate && (_gender == null || _gender!.isEmpty)) {
    userProfile.gender = userProvider.userProfile!.gender;
  } else {
    userProfile.gender = _gender ?? '';
  }

  if (isUpdate && (_country == null || _country!.isEmpty)) {
    userProfile.merchantCountry = userProvider.userProfile!.merchantCountry;
  } else {
    userProfile.merchantCountry = _country ?? '';
  }

  // Validation
  if (userProfile.firstName.isEmpty) {
    errorMessage = 'First name is required';
  } else if (userProfile.lastName.isEmpty) {
    errorMessage = 'Last name is required';
  } else if (userProfile.gender.isEmpty) {
    errorMessage = 'Please select your gender';
  } else if (userProfile.merchantCountry.isEmpty) {
    errorMessage = 'Please select your country';
  } else if (userProfile.age > 100) {
    errorMessage = 'Please enter a valid birth date';
  }
      
  if (errorMessage.isNotEmpty) {
    _showNotification(errorMessage, isError: true);
    return false;
  }

  // Save profile to database only if updating
  if (isUpdate) {
    _saveProfile();
  } else {
    // For new users, just show success message - profile will be saved after interests selection
    _showNotification('Basic profile information saved!', isError: false);
  }
  return true;
}

Future<void> _saveProfile() async {
  try {
    await userProfileHandler.editUserProfile(userProfile);
    userProvider.setUserProfile(userProfile);
    _showNotification('Profile updated successfully!', isError: false);
  } catch (e) {
    _showNotification('Failed to save profile. Please try again.', isError: true);
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
    
    // Initialize fields if updating
    if (isUpdate && userProvider.userProfile != null) {
      _cFirstName.text = userProvider.userProfile!.firstName;
      _cLastName.text = userProvider.userProfile!.lastName;
      _gender = userProvider.userProfile!.gender.isNotEmpty ? userProvider.userProfile!.gender : null;
      _country = userProvider.userProfile!.merchantCountry.isNotEmpty ? userProvider.userProfile!.merchantCountry : null;
      if (userProvider.userProfile!.dateOfBirth.year != 1970) {
        _cBDate.text = DateFormat("dd-MM-yyyy").format(userProvider.userProfile!.dateOfBirth);
      }
    }
  }

  @override
  void dispose() {
    _cFirstName.dispose();
    _cLastName.dispose();
    _cCountry.dispose();
    _cBDate.dispose();
    _cGender.dispose();
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
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: g.isDarkModeEnable ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          isUpdate ? 'Edit Profile' : 'Complete Your Profile',
          style: TextStyle(
            color: g.isDarkModeEnable ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isUpdate ? 'Update your basic profile information' : 'Let\'s get to know you better',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              // First Name Field
              Text(
                'First Name',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cFirstName,
                focusNode: _firstNameFocusNode,
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: isUpdate ? userProvider.userProfile?.firstName : 'Enter your first name',
                  hintStyle: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.AppColors.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: g.isDarkModeEnable ? Colors.white10 : Colors.grey[50],
                ),
              ),
              const SizedBox(height: 24),
              // Last Name Field
              Text(
                'Last Name',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cLastName,
                focusNode: _lastNameFocusNode,
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: isUpdate ? userProvider.userProfile?.lastName : 'Enter your last name',
                  hintStyle: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.AppColors.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: g.isDarkModeEnable ? Colors.white10 : Colors.grey[50],
                ),
              ),
              const SizedBox(height: 24),
              // Gender Selection
              Text(
                'Gender',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _gender,
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Select your gender',
                  hintStyle: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.AppColors.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: g.isDarkModeEnable ? Colors.white10 : Colors.grey[50],
                ),
                items: ['male', 'female', 'other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue;
                    _cGender.text = newValue ?? '';
                  });
                },
              ),
              const SizedBox(height: 24),
              // Country Selection
              Text(
                'Country',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _country,
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Select your country',
                  hintStyle: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.AppColors.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: g.isDarkModeEnable ? Colors.white10 : Colors.grey[50],
                ),
                items: [
                  'United States', 'Canada', 'United Kingdom', 'Germany', 'France', 'Italy',
                  'Spain', 'Netherlands', 'Belgium', 'Switzerland', 'Austria', 'Sweden',
                  'Norway', 'Denmark', 'Finland', 'Australia', 'New Zealand', 'Japan',
                  'South Korea', 'Singapore', 'Brazil', 'Argentina', 'Mexico', 'India',
                  'China', 'Thailand', 'Malaysia', 'Indonesia', 'Philippines', 'Vietnam'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _country = newValue;
                  });
                },
              ),
              const SizedBox(height: 24),
              // Date of Birth
              Text(
                'Date of Birth',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cBDate,
                focusNode: _bDateFocusNode,
                readOnly: true,
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Select your date of birth',
                  hintStyle: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.isDarkModeEnable ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: g.AppColors.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: g.isDarkModeEnable ? Colors.white10 : Colors.grey[50],
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().subtract(const Duration(days: 7300)), // 20 years ago as default
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: g.AppColors.primary, // Header background color
                            onPrimary: Colors.white, // Header text color
                            onSurface: g.isDarkModeEnable ? Colors.white : Colors.black, // Body text color
                            surface: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white, // Background color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: g.AppColors.primary, // Button text color
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          dialogBackgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    setState(() {
                      _cBDate.text = DateFormat("dd-MM-yyyy").format(picked);
                    });
                  }
                },
              ),
              const SizedBox(height: 40),
              // Save Button
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      g.AppColors.primary,
                      g.AppColors.secondary,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: g.AppColors.primary.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () async {
                    if (updateProfileUser()) {
                      // Small delay to show success message
                      await Future.delayed(const Duration(milliseconds: 500));
                      
                      if (!isUpdate) {
                        // For new users, navigate to interests selection
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LikesInterestScreen(
                              userProfile: userProfile,
                              isEditHobbies: false,
                              a: widget.analytics,
                              o: widget.observer,
                            ),
                          ),
                        );
                      } else {
                        // For profile updates, go back to main app
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationWidgetLight(
                              currentIndex: 0,
                              a: widget.analytics,
                              o: widget.observer,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    isUpdate ? 'Update Profile' : 'Continue',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}