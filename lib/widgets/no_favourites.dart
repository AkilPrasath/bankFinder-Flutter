import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoFavourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: Center(
              child: Lottie.asset(
                "assets/lottie_files/no_favourites.json",
              ),
            ),
          ),
          Center(
            child: Text(
              "No Favorite Banks added...\nStart by search using IFSC Code!",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
