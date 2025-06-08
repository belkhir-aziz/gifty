import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/screens/notification_banner_screen.dart';
import 'package:datingapp/screens/profile_detail_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends BaseRoute {
  const LoginScreen({super.key, super.a, super.o}) : super(r: 'LoginScreen');

  @override
  BaseRouteState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRouteState {
  final TextEditingController _cEmail = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();
  final TextEditingController _cConfirmPassword = TextEditingController();
  final UserProfileHandler _profileHandler = UserProfileHandler();
  late UserProvider userProvider;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLogin = true; // Toggle between Login and Sign-Up modes

  _LoginScreenState();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and Title
                Image.asset(
                  g.isDarkModeEnable
                      ? 'assets/images/logo_dark.png'
                      : 'assets/images/logo_light.png',
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to a simple icon if image fails to load
                    return Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            g.AppColors.primary,
                            g.AppColors.secondary,
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 60,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Text(
                  isLogin ? 'Welcome Back!' : 'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isLogin ? 'Sign in to continue' : 'Sign up to get started',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                // Email Field
                TextFormField(
                  controller: _cEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
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
                ),
                const SizedBox(height: 16),
                // Password Field
                TextFormField(
                  controller: _cPassword,
                  obscureText: true,
                  style: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
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
                ),
                if (!isLogin) ...[
                  const SizedBox(height: 16),
                  // Confirm Password Field
                  TextFormField(
                    controller: _cConfirmPassword,
                    obscureText: true,
                    style: TextStyle(
                      color: g.isDarkModeEnable ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(
                        color: g.isDarkModeEnable ? Colors.white54 : Colors.black54,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
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
                  ),
                ],
                const SizedBox(height: 24),
                // Login/Sign Up Button
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
                    onPressed: isLogin ? _loginUser : _signUpUser,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      isLogin ? 'Sign In' : 'Create Account',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Toggle between Login and Sign Up
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? "Don't have an account? Sign Up"
                        : "Already have an account? Sign In",
                    style: TextStyle(
                      color: g.AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Future<void> _loginUser() async {

  // for development only
  // Validate input fields
  final profile = await _profileHandler.getUserProfileWithEmail("aziz.belkhir.aziz@gmail.com");
  if(profile != null){
    userProvider.setUserProfile(profile);
  }
  Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
  if(profile != null){
    return;
  }
  final email = _cEmail.text.trim();
  final password = _cPassword.text.trim();
  if (email.isEmpty || password.isEmpty) {
    _showNotification('Email and Password cannot be empty', isError: true);
    return;
  }

  try {
    // Attempt to log the user in
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    // Check if the session exists
    if (response.session != null) {
      _showNotification('Login successful!', isError: false);

      // Retrieve the user's profile from the "Users" table
      final profile = await _profileHandler.getUserProfileWithEmail(email);
      if (profile == null) {
        _showNotification('For a nice experience, please feel your data', isError: true);
        // Create a profile for the user in the Users table
          final userProfile = UserProfile(
          id: const Uuid().v4(),
          email: email,
          firstName: '', // Placeholder - collect later
          lastName: '',  // Placeholder - collect later
          gender: '',    // Placeholder - collect later
          dateOfBirth: DateTime.now(), // Placeholder or null
          hobbies: [],   // Placeholder - collect later
        );

        // Navigate to the next screen and pass the UID and email to other components
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProfileDetailScreen(
            a: widget.analytics,
            o: widget.observer,
            userProfile: userProfile,
            isUpdate: false,
          ),
        ));
      } else {
          userProvider.setUserProfile(profile);
          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationWidgetLight(
                                    currentIndex: 0,
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
      }
    } else {
      _showNotification('Login failed: Invalid credentials.', isError: true);
    }
  } catch (e) {
    String errorMessage = e.toString();
     String extractedMessage = extractMessage(errorMessage);
    _showNotification('Sign-up failed: $extractedMessage', isError: true);
    _showNotification('Login failed: $extractedMessage', isError: true);
  }
}

Future<void> _signUpUser() async {
  final email = _cEmail.text.trim();
  final password = _cPassword.text.trim();
  final confirmPassword = _cConfirmPassword.text.trim();

  if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    _showNotification('Please fill in all fields', isError: true);
    return;
  }

  if (password != confirmPassword) {
    _showNotification('Passwords do not match', isError: true);
    return;
  }

  try {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
        // Navigate to the next screen and pass the UID and email to other components
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(
          a: widget.analytics,
          o: widget.observer,
        ),
        ));
      } 
  } catch (e) {
     String errorMessage = e.toString();
     String extractedMessage = extractMessage(errorMessage);
    _showNotification('Sign-up failed: $extractedMessage', isError: true);
  }
}
String extractMessage(String errorMessage) {
  final RegExp regex = RegExp(r'message:\s*(.*?),\s*statusCode:');
  final Match? match = regex.firstMatch(errorMessage);
  return match != null ? match.group(1) ?? '' : '';
}
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
  );
}



}
