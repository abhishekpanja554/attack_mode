import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._privateConstructor();

  static final ColorManager _instance = ColorManager._privateConstructor();

  factory ColorManager() {
    return _instance;
  }

  static Color blue = const Color(0xff0066FF);
  static Color veryDarkblue = const Color(0xff161622);
  static Color grey = const Color(0xff8B8B94);
  static Color darkGrey = const Color(0xff333333);
  static Color white = Colors.white;
  static Color lemonGreen = const Color(0xffCBD77E);
  static Color purple = const Color(0xffA49ECF);
  static Color black = const Color(0xff282828);
  static Color lightPurple = const Color(0xffE7E4F7);
}
