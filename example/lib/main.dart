import 'package:flutter/material.dart';
import 'package:prayer/prayer.dart';

final ThemeData themeData = ThemeData(
  primarySwatch: Colors.green,
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        letterSpacing: 2.5,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      titleMedium: TextStyle(
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      titleSmall: TextStyle(
        letterSpacing: 2.0,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 2.0,
        height: 2.0,
        fontSize: 18.0,
      )),
);

final configuration = PrayerConfiguration(
  showSubtitleOnListScreen: true,
  showSubtitleOnDetailsScreen: true,
  showTabBar: true,
  tabs: const [
    PrayerTabData(
      type: PrayerTabType.prayer,
      label: 'Prayers',
      icon: Icons.question_answer_outlined,
    ),
    PrayerTabData(
      type: PrayerTabType.scripture,
      label: 'Scripture',
      icon: Icons.menu_book_outlined,
    ),
    PrayerTabData(
      type: PrayerTabType.questions,
      label: 'Questions',
      icon: Icons.help_outline,
    ),
  ],
);

final List<Prayer> prayers = [
  Prayer(
    id: 0,
    title: 'The Lord\'s Prayer',
    subTitle: 'an example prayer',
    prayerText:
        'Our Father who art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so on earth. Give us this day our daily bread. And forgive us our debts, as we also have forgiven our debtors. And bring us not into temptation, but deliver us from the evil.',
    scriptureReference: 'Matthew 6:9-13',
    scriptureText:
        'Our Father who art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so on earth. Give us this day our daily bread. And forgive us our debts, as we also have forgiven our debtors. And bring us not into temptation, but deliver us from the evil.',
    questions: [
      'What does it mean to pray to God as our Father?',
      'What does it mean to pray that God\'s kingdom come?',
      'What does it mean to pray that God\'s will be done?',
      'What does it mean to pray for our daily bread?',
      'What does it mean to pray that God would forgive us?',
      'What does it mean to pray that God would not lead us into temptation?',
    ],
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PrayerApp(
      prayers: prayers,
      title: 'Example Prayer App',
      themeData: themeData,
      configuration: configuration,
    );
  }
}
