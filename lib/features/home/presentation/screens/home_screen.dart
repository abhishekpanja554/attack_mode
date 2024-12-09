import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget header() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.black,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 30,
              color: ColorManager.lemonGreen,
            ),
          ),
          CircleOutlinedButton(
            icon: CupertinoIcons.add,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: SizesManager.kGeneralPadding16,
          child: SizedBox(
            height: ScreenSize.getHeight(context),
            width: ScreenSize.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: SizesManager.kGeneralPadding10,
                  decoration: BoxDecoration(
                    borderRadius: SizesManager.kBorderRadius30,
                    color: ColorManager.purple,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Today's Progress",
                        style: TextStyleManager.kTitleStyleWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
