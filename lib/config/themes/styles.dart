import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleManager {
  TextStyleManager._privateConstructor();

  static final TextStyleManager _instance =
      TextStyleManager._privateConstructor();

  factory TextStyleManager() {
    return _instance;
  }

  static TextStyle kTitleStyleWhite = GoogleFonts.poppins(
    fontSize: 14,
    color: ColorManager.white,
    fontWeight: FontWeight.w200,
  );
}
