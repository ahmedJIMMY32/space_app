import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';
import '../models/planet_model.dart';
import '../widgets/info_row.dart';
import '../widgets/stacked_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final PlanetModel planet;

  const DetailsScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StackedAppBar(
            topTitle: planet.name,
            bottomTitle: planet.title,
            bottomAlignment: Alignment.centerLeft,
            showBackButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(planet.image, height: 250)),
                  const SizedBox(height: 16),
                  const Text('About', style: AppTextStyles.titleLarge),
                  const SizedBox(height: 8),
                  Text(planet.about, style: AppTextStyles.bodyLarge),
                  const SizedBox(height: 16),
                  InfoRow(
                    label: 'Distance from Sun (km)',
                    value: planet.distanceFromSun,
                  ),
                  InfoRow(
                    label: 'Length of Day (hours)',
                    value: planet.lengthOfDay,
                  ),
                  InfoRow(
                    label: 'Orbital Period (Earth years)',
                    value: planet.orbitalPeriod,
                  ),
                  InfoRow(label: 'Radius (km)', value: planet.radius),
                  InfoRow(label: 'Mass (kg)', value: planet.mass),
                  InfoRow(label: 'Gravity (m/s²)', value: planet.gravity),
                  InfoRow(
                    label: 'Surface Area (km²)',
                    value: planet.surfaceArea,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
