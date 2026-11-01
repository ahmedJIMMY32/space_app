import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import 'arrow_button.dart';

class StackedAppBar extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Alignment bottomAlignment;
  final bool showBackButton;
  final double height;

  const StackedAppBar({
    super.key,
    required this.topTitle,
    required this.bottomTitle,
    this.bottomAlignment = Alignment.bottomLeft,
    this.showBackButton = false,
    this.height = 190,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;
    final double totalHeight = height + statusBar;

    return SizedBox(
      width: double.infinity,
      height: totalHeight,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/moon.jpg',
            width: double.infinity,
            height: totalHeight,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.black],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: statusBar + 16),
              child: Text(topTitle, style: AppTextStyles.appBarTitle),
            ),
          ),
          Align(
            alignment: bottomAlignment,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(bottomTitle, style: AppTextStyles.appBarTitle),
            ),
          ),
          if (showBackButton)
            Positioned(
              left: 16,
              top: statusBar + 4,
              child: ArrowButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
