import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:attack_mode_app/features/current_tasks/presentation/screens/current_tasks_screen.dart';
import 'package:attack_mode_app/features/home/presentation/providers/home_screen_provider.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/swipe_up_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselWidget extends StatelessWidget {
  final List<CategoryIcon> categories;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  const CarouselWidget({
    super.key,
    required this.categories,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 1,
        onPageChanged: onPageChanged,
      ),
      items: categories
          .map(
            (item) => GestureDetector(
              onPanStart: (details) {
                if (details.localPosition.dy > 300) {
                  context.push(CurrentTasksScreen.routeName);
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: 370,
                    width: double.infinity,
                    padding: SizesManager.kGeneralPadding20,
                    decoration: BoxDecoration(
                      borderRadius: SizesManager.kBorderRadius40,
                      color: ColorManager.purple,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Become Incredibly ${item.title}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: ColorManager.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: SizesManager.kHorizontalPadding16,
                              child: LinearProgressIndicator(
                                value: 0.4,
                                borderRadius: SizesManager.kBorderRadius30,minHeight: 10,
                                backgroundColor:
                                    ColorManager.white.withValues(alpha: 0.5),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorManager.lemonGreen,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '2',
                                style: GoogleFonts.poppins(
                                  fontSize: 100,
                                  color: ColorManager.lemonGreen,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '/',
                                    style: GoogleFonts.poppins(
                                      fontSize: 100,
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '5',
                                    style: GoogleFonts.poppins(
                                      fontSize: 100,
                                      color: ColorManager.white
                                          .withValues(alpha: 0.5),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Tasks are done",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: ColorManager.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SwipeUpShimmerWidget(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                "Swipe up to mark the tasks",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
            ),
          )
          .toList(),
    );
  }
}
