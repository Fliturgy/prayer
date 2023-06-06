import 'package:flutter/material.dart';

import './image_tab.dart';
import 'prayer_tab.dart';
import './questions_tab.dart';
import './scripture_tab.dart';
import '../configuration.dart';
import '../models/prayer.dart';
import '../models/tab.dart';

class PrayerItem extends StatelessWidget {
  /// The PrayerItem class is a widget that displays a prayer.
  final Prayer prayer;
  final PrayerConfiguration configuration;
  final PrayerTabData selectedTab;

  PrayerItem(
    this.prayer, {
    required this.configuration,
    required this.selectedTab,
  });

  Widget buildTabContent(context) {
    /// The buildTabContent method returns a widget that displays the content
    /// of a tab.
    switch (selectedTab.type) {
      case PrayerTabType.image:
        return ImageTab(prayer);
      case PrayerTabType.prayer:
        return PrayerTabWidget(
          prayer,
          configuration: configuration,
        );
      case PrayerTabType.questions:
        return QuestionsTab(
          prayer,
          configuration: configuration,
        );
      case PrayerTabType.scripture:
        return ScriptureTab(
          prayer,
          configuration: configuration,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    /// The build method returns a widget that displays a prayer.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image
        if (configuration.showImageOnDetailsScreen &&
            selectedTab.type != PrayerTabType.image &&
            prayer.image != null)
          Column(
            children: [
              Image.asset(
                prayer.image ?? '',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        buildTabContent(context),
      ],
    );
  }
}
