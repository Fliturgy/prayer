import 'package:flutter/material.dart';

enum PrayerTabType {
  /// The PrayerTabType enum is used to define the type of tab.
  prayer,
  scripture,
  questions,
  image,
}

class PrayerTabData {
  /// The PrayerTabData class is a model class that represents a tab.
  final PrayerTabType type;
  final String label;
  final IconData icon;

  const PrayerTabData({
    required this.type,
    required this.label,
    required this.icon,
  });
}
