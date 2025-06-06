import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

bool isDarkModeEnable = false;
bool isRTL = false;
List<String> rtlLanguageCodeLList = ['ar', 'arc', 'ckb', 'dv', 'fa', 'ha', 'he', 'khw', 'ks', 'ps', 'ur', 'uz_AF', 'yi'];
String languageCode = 'en';

// Primary gradient colors
List<Color> gradientColors = [
  isDarkModeEnable ? const Color(0xFFDD3663) : const Color(0xFFDD3663),
  isDarkModeEnable ? const Color(0xFF483585) : const Color(0xFF483585),
];

// Background gradient colors
List<Color> scaffoldBackgroundGradientColors = [
  const Color(0xFFF8F9FA),  // Light gray
  const Color(0xFFE9ECEF),  // Slightly darker gray
];

// Theme colors
class AppColors {
  static const Color primary = Color(0xFF6B7FD7);     // Subtle blue for general UI
  static const Color secondary = Color(0xFF8B96DB);   // Light blue for general UI
  static const Color error = Color(0xFFF0384F);       // Red for product screen
  static const Color success = Color(0xFF34F07F);     // Green for product screen
  static const Color warning = Color(0xFFFFBC7D);     // Orange for product screen
  static const Color info = Color(0xFF2285FA);        // Blue for product screen
  
  // Dark theme colors
  static const Color darkBackground = Color(0xFF212529);  // Dark gray
  static const Color darkSurface = Color(0xFF343A40);     // Slightly lighter gray
  static const Color darkText = Color(0xFFFFFFFF);        // White text
  static const Color darkTextSecondary = Color(0xFFB0B0B0); // Light gray text
  
  // Light theme colors
  static const Color lightBackground = Color(0xFFF8F9FA); // Light gray
  static const Color lightSurface = Color(0xFFFFFFFF);    // White
  static const Color lightText = Color(0xFF212529);       // Dark gray text
  static const Color lightTextSecondary = Color(0xFF666666); // Medium gray text
}
