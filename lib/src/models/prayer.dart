import 'package:flutter/material.dart';

class Prayer with ChangeNotifier {
  /// The Prayer class is a model class that represents a prayer.
  final int id;
  final String title;
  final String? subTitle;
  final String prayerText;
  final String? scriptureReference;
  final String? scriptureText;
  final List<String>? questions;
  final String? image;
  bool isFavorite;

  Prayer({
    required this.id,
    required this.title,
    this.subTitle,
    required this.prayerText,
    this.scriptureReference,
    this.scriptureText,
    this.questions,
    this.image,
    this.isFavorite = false,
  });
}
