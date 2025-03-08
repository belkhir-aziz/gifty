import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/screens/notification_banner_screen.dart';
import 'package:datingapp/screens/profile_detail_screen.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLogin = true; // Toggle between Login and Sign-Up modes

  _LoginScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  isLogin
                      ? AppLocalizations.of(context)!.lbl_login
                      : "Sign Up", // Adjust the title dynamically
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
              ),
              TextFormField(
                controller: _cEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cPassword,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Enter your password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              if (!isLogin) // Show confirm password only for Sign-Up
                const SizedBox(height: 15),
              if (!isLogin)
                TextFormField(
                  controller: _cConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Confirm your password',
                    prefixIcon: Icon(
                      Icons.lock,
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
                  onPressed: isLogin ? _loginUser : _signUpUser,
                  child: Text(
                    isLogin ? 'Login' : 'Sign Up',
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
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? "Don’t have an account? Sign Up"
                      : "Already have an account? Login",
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> _loginUser() async {
  final email = _cEmail.text.trim();
  final password = _cPassword.text.trim();

  // Validate input fields
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
      final userId = response.user!.id; // Get the user's UID
      _showNotification('Login successful!', isError: false);

      // Retrieve the user's profile from the "Users" table
      final profile = await _profileHandler.getUserProfileWithEmail(email);
      if (profile == null) {
        _showNotification('For a nice experience, please feel your data', isError: true);
        // Create a profile for the user in the Users table
          final userProfile = UserProfile(
          id: userId,
          email: email,
          firstName: '', // Placeholder - collect later
          lastName: '',  // Placeholder - collect later
          gender: '',    // Placeholder - collect later
          dateOfBirth: DateTime.now(), // Placeholder or null
          hobbies: '',   // Placeholder - collect later
        );

        // Navigate to the next screen and pass the UID and email to other components
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProfileDetailScreen(
            a: widget.analytics,
            o: widget.observer,
            profileUser: userProfile
          ),
        ));
      } else {
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
    _showNotification('Login failed: $e', isError: true);
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
      final id = response.user!.id; // Get the newly created user's UID

      // Create a profile for the user in the Users table
      final userProfile = UserProfile(
      id: id,
      email: email,
      firstName: '', // Placeholder - collect later
      lastName: '',  // Placeholder - collect later
      gender: '',    // Placeholder - collect later
      dateOfBirth: DateTime.now(), // Placeholder or null
      hobbies: '',   // Placeholder - collect later
    );


        // Navigate to the next screen and pass the UID and email to other components
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProfileDetailScreen(
            a: widget.analytics,
            o: widget.observer,
            profileUser: userProfile
          ),
        ));
      } 
  } catch (e) {
    _showNotification('Sign-up failed: $e', isError: true);
  }
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
