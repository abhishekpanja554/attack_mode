import 'package:attack_mode_app/config/themes/constants.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/bottom_navigation_bar.dart';
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
      bottomNavigationBar: BottomNavBar(
        items: [
          BoxIcons.bx_home_alt_2,
          BoxIcons.bx_cog,
          BoxIcons.bxs_doughnut_chart,
        ],
      ),
    );
  }
}
