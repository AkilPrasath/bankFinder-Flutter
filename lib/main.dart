import 'package:bank_finder/UI/dashboard.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:flutter/material.dart';

import 'UI/splash_screen.dart';

void main() {
  setupLocator();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        DashBoard.id: (context) => DashBoard(),
      },
    ),
  );
}
