import 'package:flutter/material.dart';

import './models/tab.dart';

class PrayerConfiguration {
  final bool showImageOnListScreen;
  final bool showImageOnDetailsScreen;

  final bool showSubtitleOnListScreen;
  final bool showSubtitleOnDetailsScreen;

  final TextAlign prayerTextAlignment;

  final bool showTabBar;
  final List<PrayerTabData> tabs;
  final PrayerTabType defaultTabType;

  PrayerConfiguration({
    this.showImageOnListScreen = false,
    this.showImageOnDetailsScreen = false,
    this.showSubtitleOnListScreen = false,
    this.showSubtitleOnDetailsScreen = false,
    this.prayerTextAlignment = TextAlign.left,
    this.showTabBar = false,
    this.tabs = const [
      PrayerTabData(
        type: PrayerTabType.prayer,
        label: 'Prayer',
        icon: Icons.question_answer_outlined,
      ),
    ],
    this.defaultTabType = PrayerTabType.prayer,
  });
}
