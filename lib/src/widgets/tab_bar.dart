import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/prayer.dart';
import '../models/tab.dart';

class PrayerTabBar extends StatelessWidget {
  /// The PrayerTabBar class is a widget that displays a tab bar.
  final Prayer prayer;
  final void Function(int)? selectTab;
  final PrayerTabData selectedTab;
  final PrayerConfiguration configuration;

  PrayerTabBar(
    this.prayer, {
    required this.selectTab,
    required this.selectedTab,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method returns a widget that displays a tab bar.
    return BottomNavigationBar(
      onTap: selectTab,
      backgroundColor: Colors.white,
      elevation: 0,
      unselectedItemColor: Colors.black38,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: configuration.tabs.indexOf(selectedTab),
      items: configuration.tabs.map((tab) {
        return BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(tab.icon),
          label: tab.label,
        );
      }).toList(),
    );
  }
}
