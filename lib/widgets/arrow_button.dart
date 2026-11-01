import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ArrowButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
        fixedSize: const Size(44, 44),
        shape: const CircleBorder(),
      ),
      child: Icon(icon, size: 22),
    );
  }
}
