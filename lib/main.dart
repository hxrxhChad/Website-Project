// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w1/body/desktop.dart';
import 'package:w1/body/mobile.dart';
import 'package:w1/body/tablet.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/constant/responsive.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCubk2_uE3kWCcFBlQ_as1JfMh1tTk3KZs",
            authDomain: "portfolio-173c9.firebaseapp.com",
            projectId: "portfolio-173c9",
            storageBucket: "portfolio-173c9.appspot.com",
            messagingSenderId: "714174728784",
            appId: "1:714174728784:web:0724727258d2e4fe271f55",
            measurementId: "G-4KDZ7HDXZD"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: purpleC,
        scaffoldBackgroundColor: greyC,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: darkC)
            .copyWith(
              bodyLarge: const TextStyle(color: darkC),
              bodyMedium: const TextStyle(color: darkC),
            ),
      ),
      title: 'Harsh | Flutter Developer',
      home: Responsivelayout(
          desktopBody: Desktop(), mobileBody: Mobile(), tabletBody: Tablet()),
    );
  }
}
