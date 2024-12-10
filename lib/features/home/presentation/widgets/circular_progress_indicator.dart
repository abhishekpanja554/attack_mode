import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CircleProgressWidget extends StatefulWidget {
  final double progress;

  const CircleProgressWidget({super.key, required this.progress});

  @override
  State<CircleProgressWidget> createState() => _CircleProgressWidgetState();
}

class _CircleProgressWidgetState extends State<CircleProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation tween;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    tween = Tween(
      begin: 0.0,
      end: widget.progress,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
    controller.forward();
    // controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: AnimatedBuilder(
          animation: tween,
          builder: (context, child) {
            return CircularProgressIndicator(
              value: tween.value,
              strokeCap: StrokeCap.round,
              strokeWidth: 20,
              backgroundColor: ColorManager.lightPurple,
              strokeAlign: -0.3,
            );
          }),
    );
  }
}
