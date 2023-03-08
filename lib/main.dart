import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'landing.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', 'KR'),
        // Locale('es', ''), // Spanish, no country code
      ],
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Maple"),
      home: LandingPage(),
    );
  }
}
