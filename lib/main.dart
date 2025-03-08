import 'package:datingapp/Theme/native_theme.dart';
import 'package:datingapp/l10n/l10n.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/provider/local_provider.dart';
import 'package:datingapp/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://qczlshaglldtcmgczbgj.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjemxzaGFnbGxkdGNtZ2N6YmdqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDEzNDE3MzgsImV4cCI6MjA1NjkxNzczOH0.jzRZj9_vyvprqBpJuJBOXZwxSI0I6Ncl3LpaLks1Kto';
Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  dynamic analytics;
  dynamic observer;

  @override
  void initState() {
    super.initState();
    //_init();
  }

  // Future () async {
  //   try {
  //     var brightness = SchedulerBinding.instance.window.platformBrightness;
  //     print("HEllo main");
  //     bool isDarkMode = brightness == Brightness.dark;
  //     g.isDarkModeEnable = isDarkMode;
  //   } catch (e) {
  //     print('Exception - base.dart - (): ' + e.toString());
  //   }
  // }

  // _init() async {
  //   try {
  //     SharedPreferences sp = await SharedPreferences.getInstance();
  //     if (sp.containsKey('isDarkMode') && sp.getBool('isDarkMode') != null) {
  //       g.isDarkModeEnable = sp.getBool('isDarkMode');
  //     } else {
  //       g.isDarkModeEnable = false;
  //     }
  //   } catch (e) {
  //     print('Exception - main.dart - _init(): ' + e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: nativeTheme(g.isDarkModeEnable),
          home: IntroScreen(a: analytics, o: observer),
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      });
}
