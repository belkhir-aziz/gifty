import 'package:flutter/material.dart';

ThemeData nativeTheme(bool isDarkModeEnable) {
  if (isDarkModeEnable) {
    return ThemeData(
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white, selectionHandleColor: Colors.white),
        primaryColor: const Color(0xFF14012E),
        primaryColorDark: const Color(0xFF14012E),
        primaryColorLight: const Color(0xFFDD3663),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        primaryTextTheme: TextTheme(
          displayLarge: const TextStyle(
              fontSize: 29,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3),
          displayMedium: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          displaySmall: const TextStyle(
              fontSize: 19, color: Colors.white, fontWeight: FontWeight.w400),
          headlineMedium: const TextStyle(
              color: Color(0xFFEF3A6A),
              fontSize: 12,
              fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(
              fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: const TextStyle(fontSize: 10, color: Colors.white),
          titleMedium: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          titleSmall: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              fontWeight: FontWeight.normal),
          bodyLarge: const TextStyle(fontSize: 13, color: Colors.white70),
          bodyMedium: const TextStyle(
              fontSize: 10, color: Colors.white60, fontWeight: FontWeight.w400),
          bodySmall: TextStyle(color: Colors.grey[800], fontSize: 10),
          // for display time
          labelSmall: TextStyle(
              color: Colors.grey[800],
              fontSize: 10,
              fontWeight: FontWeight.normal,
              letterSpacing: 0),
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: const TextStyle(
              fontSize: 22,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.bold),
          // reward selected text
          displaySmall: const TextStyle(
              fontSize: 22,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.bold),
          // reward dialog text
          headlineMedium: const TextStyle(color: Colors.white, fontSize: 18),
          headlineSmall: const TextStyle(
              fontSize: 14,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w700),
          // rewars dialog
          titleLarge: const TextStyle(color: Color(0xFF8169DE), fontSize: 14),
          // payment Liked Text
          titleMedium: const TextStyle(fontSize: 13, color: Colors.white),
          // plan dating subtitle
          titleSmall: const TextStyle(fontSize: 13, color: Colors.white60),
          // rewars subtitle
          bodyLarge:
              TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.w600),
          bodyMedium: const TextStyle(
              fontSize: 14,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.w700),
          bodySmall: const TextStyle(
              fontSize: 13,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.w400),
          labelSmall: const TextStyle(
              color: Color(0xFFDD3663),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'Lexend',
        dividerColor: Colors.transparent,
        disabledColor: const Color(0xFF33196B),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
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
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.all(0),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Color(0xFF862254),
          unselectedLabelColor: Color(0xFF483585),
          labelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF862254),
              fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF483585),
              fontWeight: FontWeight.w500),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
          unselectedIconTheme:
              IconThemeData(color: Colors.transparent, size: 26),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ));
  } else {
    return ThemeData(
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF33196B),
          selectionHandleColor: Color(0xFF33196B),
        ),
        primaryColor: const Color(0xFF14012E),
        primaryColorLight: const Color(0xFFDD3663),
        primaryColorDark: const Color(0xFF14012E),
        disabledColor: const Color(0xFF33196B),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        primaryTextTheme: TextTheme(
          displayLarge: const TextStyle(
              fontSize: 29,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3),
          displayMedium: const TextStyle(
              fontSize: 22,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w500),
          displaySmall: const TextStyle(
              fontSize: 19,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w400),
          headlineMedium: const TextStyle(
              color: Color(0xFF33196B),
              fontSize: 12,
              fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xFF33196B)),
          titleLarge: const TextStyle(fontSize: 10, color: Colors.white),
          titleMedium: const TextStyle(
              fontSize: 14,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w700),
          titleSmall: const TextStyle(
              fontSize: 13,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w400),
          bodyLarge: const TextStyle(
              fontSize: 13,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w500),
          bodyMedium: const TextStyle(
              fontSize: 10,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w400),
          bodySmall: TextStyle(color: Colors.grey[800], fontSize: 10),
          // for display time
          labelSmall: TextStyle(
              color: Colors.purple[100],
              fontSize: 10,
              fontWeight: FontWeight.normal,
              letterSpacing: 0),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF33196B)),
          displayMedium: TextStyle(
              fontSize: 22,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.bold),
          // reward selected text
          displaySmall: TextStyle(
              fontSize: 22,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.bold),
          // reward dialog text
          headlineMedium: TextStyle(color: Colors.white, fontSize: 18),
          headlineSmall: TextStyle(
              fontSize: 14,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w700),
          // rewars dialog
          titleLarge: TextStyle(color: Color(0xFF8169DE), fontSize: 14),
          // payment Liked Text
          titleMedium: TextStyle(fontSize: 13, color: Colors.white),
          titleSmall: TextStyle(fontSize: 13, color: Colors.white60),
          // rewars subtitle
          bodyLarge:
              TextStyle(color: Color(0xFFDD3663), fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(
              fontSize: 14,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
              fontSize: 13,
              color: Color(0xFFDD3663),
              fontWeight: FontWeight.w400),
          labelSmall: TextStyle(
              color: Color(0xFFDD3663),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xFFEEFCFF),
        fontFamily: 'Lexend',
        dividerColor: Colors.transparent,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(
              fontSize: 15,
              color: Color(0xFF33196B),
              fontWeight: FontWeight.w400),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(color: Colors.transparent, size: 26),
          unselectedIconTheme:
              IconThemeData(color: Colors.transparent, size: 26),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
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
        iconTheme: const IconThemeData(color: Color(0xFF3929C7)),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color(0xFF483585),
          labelPadding: EdgeInsets.all(0),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Color(0xFF33196B),
          labelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF862254),
              fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF483585),
              fontWeight: FontWeight.w500),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ));
  }
}
