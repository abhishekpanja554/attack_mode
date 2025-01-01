import 'package:attack_mode_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CircleOutlinedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CircleOutlinedButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20), // Adjust the size of the button
          backgroundColor: ColorManager.veryDarkblue, // Button fill color
          foregroundColor: ColorManager.white,
          shape: const CircleBorder(),
        ),
        child: Icon(icon, size: 24), // Optional: Icon or Text inside the button
      ),
    );
  }
}
