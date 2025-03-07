import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/notification_banner_screen.dart';
import 'package:datingapp/screens/verify_otp_screen.dart';
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

  if (email.isEmpty || password.isEmpty) {
    _showNotification('Email and Password cannot be empty', isError: true);
    return;
  }

  try {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.session != null) {
      _showNotification('Login successful!', isError: false);
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => VerifyOtpScreen(
          a: widget.analytics,
          o: widget.observer,
        ),
      ));
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
      _showNotification('Sign-up successful! Check your email for verification.', isError: false);
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => VerifyOtpScreen(
          a: widget.analytics,
          o: widget.observer,
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
