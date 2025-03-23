import 'package:datingapp/models/user_profile.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class UserProvider with ChangeNotifier {
  UserProfile? _userProfile;
  List<Product>? _cachedProducts;

  UserProfile? get userProfile => _userProfile;
  List<Product>? get cachedProducts => _cachedProducts;

  void setUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  void updateUserProfile({
    String? firstName,
    String? lastName,
    String? gender,
    DateTime? dateOfBirth,
    List<String>? hobbies,
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
    _cachedProducts = null;
    notifyListeners();
  }

  void clearCachedProducts() {
    _cachedProducts = [];
    notifyListeners();
  }

  void setCachedProducts(List<Product> products) {
    _cachedProducts = products;
    notifyListeners();
  }

  void removeInteractedProduct(String productId) {
    if (_cachedProducts != null && _cachedProducts!.isNotEmpty) {
      _cachedProducts = _cachedProducts!.where((product) => product.id != productId).toList();
      notifyListeners();
    }
  }
}