import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/prayer.dart';

class PrayerTabWidget extends StatelessWidget {
  final Prayer prayer;
  final PrayerConfiguration configuration;

  PrayerTabWidget(
    this.prayer, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtitle
        if (configuration.showSubtitleOnDetailsScreen &&
            (prayer.subTitle ?? '') != '')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              prayer.subTitle ?? '',
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 45.0,
          ),
          child: Text(
            prayer.prayerText,
            softWrap: true,
            textAlign: configuration.prayerTextAlignment,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
