import 'package:flutter/material.dart';

import 'prayer.dart';

class Prayers with ChangeNotifier {
  /// The Prayers class is a model class that represents a list of prayers.
  final List<Prayer> _prayers;

  Prayers(this._prayers);

  List<Prayer> get prayers {
    return [..._prayers];
  }
}
