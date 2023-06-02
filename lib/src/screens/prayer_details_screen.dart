import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/prayers.dart';
import '../models/tab.dart';
import '../widgets/app_bar.dart';
import '../widgets/prayer_item.dart';
import '../widgets/tab_bar.dart';

class PrayerDetailsScreen extends StatefulWidget {
  static const routeName = '/prayer-details';

  final PrayerConfiguration configuration;

  PrayerDetailsScreen({
    required this.configuration,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PrayerDetailsScreenState createState() => _PrayerDetailsScreenState();
}

class _PrayerDetailsScreenState extends State<PrayerDetailsScreen> {
  late PrayerTabData _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.configuration.tabs.firstWhere(
        (element) => element.type == widget.configuration.defaultTabType);
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTab = widget.configuration.tabs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final prayers = Provider.of<Prayers>(context).prayers;
    final prayerId = ModalRoute.of(context)?.settings.arguments as int;
    final prayer = prayers.firstWhere((element) => element.id == prayerId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrayerAppBar(
        prayer.title,
        hasBackButton: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: PrayerItem(
            prayer,
            configuration: widget.configuration,
            selectedTab: _selectedTab,
          ),
        ),
      ),
      bottomNavigationBar: widget.configuration.showTabBar &&
              widget.configuration.tabs.length > 1
          ? PrayerTabBar(
              prayer,
              selectTab: _selectTab,
              selectedTab: _selectedTab,
              configuration: widget.configuration,
            )
          : null,
    );
  }
}
