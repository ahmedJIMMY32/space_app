import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.black),
      home: const IntroScreen(),
    );
  }
}
