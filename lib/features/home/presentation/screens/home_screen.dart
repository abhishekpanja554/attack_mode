import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/sizes.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:attack_mode_app/core/util/screen_size.dart';
import 'package:attack_mode_app/core/widgets/circle_outline_button.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/circular_progress_indicator.dart';
import 'package:attack_mode_app/features/home/presentation/widgets/stat_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

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
              SizesManager.kSpace20,
              Expanded(
                child: ClipRRect(
                  borderRadius: SizesManager.kBorderRadius16,
                  child: CustomPaint(
                    painter: ContainerPatternPainter(),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      padding: SizesManager.kGeneralPadding10,
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

class ContainerPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DiagonalStripesLight(
            bgColor: Color(0xffB8B2DB),
            fgColor: Colors.white.withValues(alpha: 0.2))
        .paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
