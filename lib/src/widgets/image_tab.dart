import 'package:flutter/material.dart';

import '../models/prayer.dart';

class ImageTab extends StatelessWidget {
  final Prayer prayer;

  ImageTab(this.prayer);

  @override
  Widget build(BuildContext context) {
    return prayer.image != null
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 45.0,
            ),
            child: Image.asset(
              prayer.image ?? '',
            ),
          )
        : Container();
  }
}
