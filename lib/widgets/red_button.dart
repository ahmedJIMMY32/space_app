import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text_styles.dart';

class RedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.all(16),
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.buttonText),
            const Icon(Icons.arrow_forward, size: 22),
          ],
        ),
      ),
    );
  }
}
