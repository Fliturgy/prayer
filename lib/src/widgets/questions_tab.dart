import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/prayer.dart';

class QuestionsTab extends StatelessWidget {
  /// The QuestionsTab class is a widget that displays a list of questions.
  final Prayer prayer;
  final PrayerConfiguration configuration;

  QuestionsTab(
    this.prayer, {
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    /// The build method returns a widget that displays a list of questions.
    return (prayer.questions ?? []).isNotEmpty
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Questions',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListView.builder(
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 45.0,
                  ),
                  child: Text(
                    prayer.questions?[index] ?? '',
                    textAlign: configuration.prayerTextAlignment,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                itemCount: prayer.questions?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          )
        : Container();
  }
}
