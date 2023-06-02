import 'package:flutter/material.dart';

import 'prayer.dart';

class Prayers with ChangeNotifier {
  final List<Prayer> _prayers;

  Prayers(this._prayers);

  List<Prayer> get prayers {
    return [..._prayers];
  }
}
