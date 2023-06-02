import 'package:flutter/material.dart';

enum PrayerTabType {
  prayer,
  scripture,
  questions,
  image,
}

class PrayerTabData {
  final PrayerTabType type;
  final String label;
  final IconData icon;

  const PrayerTabData({
    required this.type,
    required this.label,
    required this.icon,
  });
}
