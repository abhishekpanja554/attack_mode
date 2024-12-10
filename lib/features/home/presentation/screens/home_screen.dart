import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/circular_progress_indicator.dart';
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

  Widget progressWidget() {
    return Container(
      width: double.infinity,
      height: 200,
      padding: SizesManager.kGeneralPadding16,
      decoration: BoxDecoration(
        borderRadius: SizesManager.kBorderRadius30,
        color: ColorManager.purple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Progress",
            style: TextStyleManager.kTitleStyleWhiteThin14,
          ),
          Text(
            "Your daily progress of all the tasks are shown here",
            style: TextStyleManager.kSubtitleStyleWhiteThin14,
          ),
          SizesManager.kSpace32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleProgressWidget(
                  progress: 0.6,
                ),
              ),
              SizesManager.kSpace16,
              Container(
                height: 80,
                constraints: BoxConstraints(minWidth: 200),
                padding: SizesManager.kGeneralPadding8,
                decoration: BoxDecoration(
                  borderRadius: SizesManager.kBorderRadius30,
                  color: Color(0xffF7F9EA)
                ),
                child: Column(
                  children: [
                    Text(
                      "Today's Progress",
                      style: TextStyleManager.kTitleStyleWhite14,
                    ),
                    Text(
                      "Your daily progress",
                      style: TextStyleManager.kTitleStyleWhite14,
                    ),
                  ],
                ),
              )
            ],
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
                SizesManager.kSpace16,
                progressWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
