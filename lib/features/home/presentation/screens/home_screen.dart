import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:attack_mode_app/features/home/presentation/providers/home_screen_provider.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/carousel_widget.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/circular_progress_indicator.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/stat_info_widget.dart';
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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: ColorManager.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: CircleProgressWidget(
                  progress: 0.6,
                ),
              ),
              SizesManager.kSpace20,
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 200),
                  decoration: BoxDecoration(
                    color: ColorManager.darkGrey,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: ColorManager.grey,
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatInfoWidget(
                        title: "Rich",
                        value: "2",
                        outOf: "5",
                      ),
                      StatInfoWidget(
                        title: "Muscular",
                        value: "2",
                        outOf: "5",
                      ),
                      StatInfoWidget(
                        title: "Discipline",
                        value: "2",
                        outOf: "5",
                      ),
                    ],
                  ),
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
    HomePageState homePageProvider = ref.watch(homePageStateNotifierProvider);
    HomePageStateNotifier homePageProviderNotifier =
        ref.read(homePageStateNotifierProvider.notifier);
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
                Text(
                  "Today's Progress",
                  style: TextStyleManager.kTitleStyleWhite14
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizesManager.kSpace10,
                progressWidget(),
                SizesManager.kSpace32,
                CarouselWidget(
                  categories: homePageProvider.categories,
                  onPageChanged: (index, reason) {
                    homePageProviderNotifier.changeCurrentCategoryIndex(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
