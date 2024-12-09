import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/features/base/presentation/widgets/bottom_navigation_bar.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:attack_mode_app/features/base/presentation/providers/base_screen_provider.dart';
import 'package:attack_mode_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  Widget header() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.white,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 30,
              color: ColorManager.blue,
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
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateNotifierProvider);
    final pageStateNotifier = ref.watch(pageStateNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageState.controller,
              onPageChanged: (value) {
                pageStateNotifier.changePageIndex(value);
              },
              children: [
                const HomeScreen(),
                Container(
                  child: const Text("Settings"),
                ),
                Container(
                  child: const Text("CHarts"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(
                onItemTap: (int index) {
                  pageStateNotifier.changePageIndex(index);
                  pageState.controller.jumpToPage(
                    index,
                    // duration: const Duration(milliseconds: 100),
                    // curve: Curves.ease,
                  );
                },
                items: const [
                  BoxIcons.bx_home_alt_2,
                  BoxIcons.bx_cog,
                  BoxIcons.bxs_doughnut_chart,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
