import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, DashBoard.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Find My Bank",
                  key: Key("splashscreen_text"),
                  style: GoogleFonts.suezOne(
                    fontSize: 30,
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Lottie.asset(
                  "assets/lottie_files/liquid_loader.json",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
