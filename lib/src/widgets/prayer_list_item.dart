import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/prayer.dart';
import '../screens/prayer_details_screen.dart';

class PrayerListItem extends StatelessWidget {
  final Prayer prayer;
  final PrayerConfiguration configuration;

  PrayerListItem(
    this.prayer, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: configuration.showImageOnListScreen && prayer.image != null
          ? Image(
              image: AssetImage(
                prayer.image ?? '',
              ),
            )
          : null,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Text(
              prayer.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (configuration.showSubtitleOnListScreen &&
                (prayer.subTitle ?? '') != '')
              SizedBox(height: 8.0),
            if (configuration.showSubtitleOnListScreen &&
                (prayer.subTitle ?? '') != '')
              Text(
                prayer.subTitle ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
          ],
        ),
        alignment: Alignment.center,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          PrayerDetailsScreen.routeName,
          arguments: prayer.id,
        );
      },
    );
  }
}
