import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';
import '../data/planets_data.dart';
import '../widgets/arrow_button.dart';
import '../widgets/red_button.dart';
import '../widgets/stacked_app_bar.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: 0.7);
  int currentIndex = 0;

  void goToPrevious() {
    if (currentIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToNext() {
    if (currentIndex < planets.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[currentIndex];

    return Scaffold(
      body: Column(
        children: [
          const StackedAppBar(
            topTitle: 'Explore',
            bottomTitle: 'Which planet\nwould you like to explore?',
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: planets.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(planets[index].image, fit: BoxFit.contain),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowButton(icon: Icons.arrow_back, onPressed: goToPrevious),
                Text(planet.name, style: AppTextStyles.titleLarge),
                ArrowButton(icon: Icons.arrow_forward, onPressed: goToNext),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: RedButton(
                title: 'Explore ${planet.name}',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(planet: planet),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
