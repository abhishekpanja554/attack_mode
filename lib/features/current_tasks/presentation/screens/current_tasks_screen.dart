import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CurrentTasksScreen extends StatefulWidget {
  static const String routeName = '/current-tasks';
  const CurrentTasksScreen({super.key});

  @override
  State<CurrentTasksScreen> createState() => _CurrentTasksScreenState();
}

class _CurrentTasksScreenState extends State<CurrentTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Hero(
            tag: 'item',
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: SizesManager.kBorderRadius40,
                color: ColorManager.black,
                border: Border.all(
                  color: ColorManager.white,
                  width: 5,
                ),
              ),
              child: Icon(
                FontAwesome.sack_dollar_solid,
                color: ColorManager.lemonGreen,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
