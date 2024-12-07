import 'package:attack_mode_app/config/themes/constants.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget header() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager().white,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 30,
              color: ColorManager().blue,
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
      backgroundColor: ColorManager().white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: ScreenSize.getHeight(context),
            width: ScreenSize.getWidth(context),
            child: Column(
              children: [
                header(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 305,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ColorManager().black,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorManager().lemonGreen,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BoxIcons.bx_home_alt_2,
                          size: 30,
                          color: ColorManager().veryDarkblue,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorManager().white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BoxIcons.bx_cog,
                          size: 30,
                          color: ColorManager().veryDarkblue,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorManager().white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BoxIcons.bx_circle_three_quarter,
                          size: 30,
                          color: ColorManager().veryDarkblue,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorManager().white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BoxIcons.bx_user,
                          size: 30,
                          color: ColorManager().grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
