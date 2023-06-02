import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/prayer.dart';

class ScriptureTab extends StatelessWidget {
  final Prayer prayer;
  final PrayerConfiguration configuration;

  ScriptureTab(
    this.prayer, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    return prayer.scriptureReference != null && prayer.scriptureText != null
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  prayer.scriptureReference ?? '',
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
                  prayer.scriptureText ?? '',
                  softWrap: true,
                  textAlign: configuration.prayerTextAlignment,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          )
        : Container();
  }
}
