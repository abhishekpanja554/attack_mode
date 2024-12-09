import 'package:flutter/material.dart';

class ColorClass {}

class ColorManager {
  ColorManager._privateConstructor();

  static final ColorManager _instance = ColorManager._privateConstructor();

  factory ColorManager() {
    return _instance;
  }

  Color blue = const Color(0xff0066FF);
  Color veryDarkblue = const Color(0xff161622);
  Color grey = const Color(0xff8B8B94);
  Color darkGrey = const Color(0xff333333);
  Color white = Colors.white;
  Color lemonGreen = const Color(0xffCBD77E);
  Color purple = const Color(0xffA49ECF);
  Color black = const Color(0xff282828);
  Color lightPurple = const Color(0xffE7E4F7);
}
