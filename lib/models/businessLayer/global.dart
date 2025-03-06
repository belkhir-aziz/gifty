import 'package:flutter/widgets.dart';

bool isDarkModeEnable = false;
bool isRTL = false;
List<String> rtlLanguageCodeLList = ['ar', 'arc', 'ckb', 'dv', 'fa', 'ha', 'he', 'khw', 'ks', 'ps', 'ur', 'uz_AF', 'yi'];
String? languageCode;

List<Color> gradientColors = [
  isDarkModeEnable ? const Color(0xFF862254) : const Color(0xFFFA457E),
  isDarkModeEnable ? const Color(0xFF483585) : const Color(0xFF7B49FF),
];

List<Color> scaffoldBackgroundGradientColors = [
  const Color(0xFF03000C),
  const Color(0xFF292343),
];
