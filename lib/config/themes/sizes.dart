import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SizesManager {
  SizesManager._privateConstructor();

  static final SizesManager _instance =
      SizesManager._privateConstructor();

  factory SizesManager() {
    return _instance;
  }

  static const kEmptyWidget = SizedBox.shrink();

  static const kSpace0 = Gap(0);
  static const kSpace8 = Gap(8);
  static const kSpace10 = Gap(10);
  static const kSpace16 = Gap(16);
  static const kSpace20 = Gap(20);
  static const kSpace32 = Gap(32);

  static final kBorderRadius8 = BorderRadius.circular(8);
  static final kBorderRadius16 = BorderRadius.circular(16);
  static final kBorderRadius30 = BorderRadius.circular(30);
  static final kBorderRadius40 = BorderRadius.circular(40);
  

  static const kGeneralPadding8 = EdgeInsets.all(8);
  static const kGeneralPadding10 = EdgeInsets.all(10);
  static const kGeneralPadding16 = EdgeInsets.all(16);
  static const kGeneralPadding32 = EdgeInsets.all(32);
  static const kHorizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
  static const kHorizontalPadding16 = EdgeInsets.symmetric(horizontal: 16);
  static const kHorizontalPadding32 = EdgeInsets.symmetric(horizontal: 32);
}