import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/features/home/presentation/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class CarouselWidget extends ConsumerWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(homePageStateNotifierProvider);
    final pageStateNotifier = ref.watch(homePageStateNotifierProvider.notifier);
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 1,
        onPageChanged: (index, reason) {
          pageStateNotifier.changeCurrentCategoryIndex(index);
        },
      ),
      items: pageState.categories
          .map(
            (item) => Stack(
              children: [
                Container(
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: SizesManager.kBorderRadius30,
                    color: ColorManager.purple,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
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
                        item.icon,
                        color: ColorManager.lemonGreen,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
