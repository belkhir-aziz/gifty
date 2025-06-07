import 'package:flutter/material.dart';

ThemeData nativeTheme(bool isDarkModeEnable) {
  if (isDarkModeEnable) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF9C27B0),
        secondary: const Color(0xFFE91E63),
        surface: const Color(0xFF03000C),
        background: const Color(0xFF03000C),
        error: const Color(0xFFF0384F),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionHandleColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lexend',
        ),
      ),
      primaryTextTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: const TextStyle(
          color: Color(0xFF9C27B0),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: const TextStyle(
          fontSize: 12,
          color: Colors.white70,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          color: Colors.white70,
        ),
        bodyMedium: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.grey[400],
          fontSize: 10,
        ),
        labelSmall: TextStyle(
          color: Colors.grey[400],
          fontSize: 10,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          fontSize: 20,
          color: Color(0xFFE91E63),
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        headlineSmall: const TextStyle(
          fontSize: 16,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w700,
        ),
        titleLarge: const TextStyle(
          color: Color(0xFFE91E63),
          fontSize: 16,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        titleSmall: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
        ),
        bodyLarge: TextStyle(
          color: const Color(0xFF9C27B0),
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: Color(0xFFE91E63),
          fontWeight: FontWeight.w700,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w400,
        ),
        labelSmall: const TextStyle(
          color: Color(0xFFE91E63),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: 'Lexend',
      dividerColor: Colors.transparent,
      disabledColor: const Color(0xFF9C27B0),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      tabBarTheme: const TabBarTheme(
        labelPadding: EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Color(0xFF9C27B0),
        unselectedLabelColor: Color(0xFFE91E63),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFE91E63),
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
        unselectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1A1A2E),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF9C27B0)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  } else {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF9C27B0),
        secondary: const Color(0xFFE91E63),
        surface: const Color(0xFFEEFCFF),
        background: const Color(0xFFEEFCFF),
        error: const Color(0xFFF0384F),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF9C27B0),
        selectionHandleColor: Color(0xFF9C27B0),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF9C27B0)),
        titleTextStyle: TextStyle(
          color: const Color(0xFF9C27B0),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lexend',
        ),
      ),
      primaryTextTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 32,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w600,
        ),
        displaySmall: const TextStyle(
          fontSize: 20,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: const TextStyle(
          color: Color(0xFF9C27B0),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9C27B0),
        ),
        titleLarge: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w700,
        ),
        titleSmall: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.grey[800],
          fontSize: 10,
        ),
        labelSmall: TextStyle(
          color: const Color(0xFF9C27B0).withOpacity(0.7),
          fontSize: 10,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF9C27B0),
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: const Color(0xFF9C27B0),
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          color: const Color(0xFFE91E63),
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: const Color(0xFF9C27B0),
          fontWeight: FontWeight.w700,
        ),
        titleLarge: const TextStyle(
          color: Color(0xFFE91E63),
          fontSize: 16,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        titleSmall: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
        ),
        bodyLarge: TextStyle(
          color: const Color(0xFF9C27B0),
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: const Color(0xFFE91E63),
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: const Color(0xFF9C27B0),
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: const Color(0xFFE91E63),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFFEEFCFF),
      fontFamily: 'Lexend',
      dividerColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Color(0xFF9C27B0)),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
        unselectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              color: Color(0xFF9C27B0),
              fontWeight: FontWeight.w500,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF9C27B0)),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xFFE91E63),
        labelPadding: EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Color(0xFF9C27B0),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFF9C27B0),
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFE91E63),
          fontWeight: FontWeight.w500,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF9C27B0)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
