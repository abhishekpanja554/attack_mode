import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:flutter/material.dart';

class StatInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final String outOf;
  const StatInfoWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.outOf});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: TextStyleManager.kTitleStyleWhite14Bold.copyWith(color: ColorManager.white),
        ),
        RichText(
          text: TextSpan(
            text: '$value ',
            style: TextStyleManager.kSubtitleStyleWhiteThin14
                .copyWith(color: const Color.fromARGB(255, 120, 224, 123),fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: 'of',
                style: TextStyleManager.kSubtitleStyleWhiteThin14,
              ),
              TextSpan(
                text: ' $outOf',
                style: TextStyleManager.kSubtitleStyleWhiteThin14
                    .copyWith(color: const Color.fromARGB(255, 254, 108, 108)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
