import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './configuration.dart';

import 'models/prayer.dart';
import 'models/prayers.dart';

import 'screens/prayer_details_screen.dart';
import 'screens/prayer_list_screen.dart';

class PrayerApp extends StatelessWidget {
  final List<Prayer> prayers;
  final String title;
  final ThemeData themeData;
  final PrayerConfiguration configuration;

  PrayerApp({
    required this.prayers,
    required this.title,
    required this.themeData,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Prayers(prayers),
        ),
      ],
      child: MaterialApp(
        title: title,
        theme: themeData,
        routes: {
          PrayerListScreen.routeName: (context) => PrayerListScreen(
                title: title,
                configuration: configuration,
              ),
          PrayerDetailsScreen.routeName: (context) => PrayerDetailsScreen(
                configuration: configuration,
              ),
        },
      ),
    );
  }
}
