import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:attack_mode_app/config/themes/styles.dart';
import 'package:flutter/material.dart';

class CircleProgressWidget extends StatefulWidget {
  final double progress;

  const CircleProgressWidget({super.key, required this.progress});

  @override
  State<CircleProgressWidget> createState() => _CircleProgressWidgetState();
}

class _CircleProgressWidgetState extends State<CircleProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController barAnimationController;
  late Animation tween;

  @override
  void initState() {
    barAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    tween = Tween(
      begin: 0.0,
      end: widget.progress,
    ).animate(
      CurvedAnimation(
        parent: barAnimationController,
        curve: Curves.decelerate,
      ),
    );
    barAnimationController.forward();
    // controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    barAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tween,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                value: tween.value,
                strokeCap: StrokeCap.round,
                strokeWidth: 15,
                backgroundColor: ColorManager.lightPurple,
                strokeAlign: -0.3,
              ),
            ),
            Text(
              "${(tween.value * 100).toStringAsFixed(0)}%",
              style: TextStyleManager.kSubtitleStyleWhiteThin14.copyWith(
                fontSize: 13,
              ),
            )
          ],
        );
      },
    );
  }
}
