import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/prayers.dart';
import '../widgets/app_bar.dart';
import '../widgets/prayer_list_item.dart';

class PrayerListScreen extends StatelessWidget {
  /// The PrayerListScreen class is a stateless widget that represents the list
  /// screen for a prayer.
  static const routeName = '/';

  final String title;
  final PrayerConfiguration configuration;

  PrayerListScreen({
    required this.title,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method is a lifecycle method that is called when the widget
    /// is rebuilt.
    final liturgies = Provider.of<Prayers>(context).prayers;

    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: Drawer(),
      appBar: PrayerAppBar(title),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: liturgies.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return PrayerListItem(
            liturgies[index],
            configuration: configuration,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
