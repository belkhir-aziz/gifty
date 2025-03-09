import 'package:datingapp/models/user_profile.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  void setUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  void updateUserProfile({
    String? firstName,
    String? lastName,
    String? gender,
    DateTime? dateOfBirth,
    String? hobbies,
  }) {
    if (_userProfile != null) {
      _userProfile = UserProfile(
        id: _userProfile!.id,
        email: _userProfile!.email,
        firstName: firstName ?? _userProfile!.firstName,
        lastName: lastName ?? _userProfile!.lastName,
        gender: gender ?? _userProfile!.gender,
        dateOfBirth: dateOfBirth ?? _userProfile!.dateOfBirth,
        hobbies: hobbies ?? _userProfile!.hobbies,
      );
      notifyListeners();
    }
  }

  void clearUserProfile() {
    _userProfile = null;
    notifyListeners();
  }
}