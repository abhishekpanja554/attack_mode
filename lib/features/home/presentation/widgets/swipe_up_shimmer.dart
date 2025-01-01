import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SwipeUpShimmerWidget extends StatefulWidget {
  const SwipeUpShimmerWidget({super.key});

  @override
  State<SwipeUpShimmerWidget> createState() => _SwipeUpShimmerWidgetState();
}

class _SwipeUpShimmerWidgetState extends State<SwipeUpShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController.unbounded(
      vsync: this,
    )..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(seconds: 1),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              transform: _SlideTransform(slidePercent: _controller.value),
              colors: [
                Colors.white,
                Colors.white.withValues(alpha: 0.5),
                Colors.white.withValues(alpha: 0.2),
                Colors.white.withValues(alpha: 0.5),
                Colors.white,
              ],
              stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
            ).createShader(bounds),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  BoxIcons.bx_chevrons_up,
                  size: 24,
                ),
              ],
            ),
          );
        });
  }
}

class _SlideTransform extends GradientTransform {
  final double slidePercent;

  _SlideTransform({required this.slidePercent});
  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, bounds.height * slidePercent, 0);
  }
}
