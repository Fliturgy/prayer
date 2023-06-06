import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configuration.dart';
import '../models/prayers.dart';
import '../models/tab.dart';
import '../widgets/app_bar.dart';
import '../widgets/prayer_item.dart';
import '../widgets/tab_bar.dart';

class PrayerDetailsScreen extends StatefulWidget {
  /// The PrayerDetailsScreen class is a stateful widget that represents the
  /// details screen for a prayer.
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
  /// The _PrayerDetailsScreenState class is a state class for the
  /// PrayerDetailsScreen class.
  late PrayerTabData _selectedTab;

  @override
  void initState() {
    /// The initState method is a lifecycle method that is called when the
    /// widget is first inserted into the tree.
    super.initState();
    _selectedTab = widget.configuration.tabs.firstWhere(
        (element) => element.type == widget.configuration.defaultTabType);
  }

  void _selectTab(int index) {
    /// The _selectTab method is a method that is called when a tab is selected.
    setState(() {
      _selectedTab = widget.configuration.tabs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    /// The build method is a lifecycle method that is called when the widget
    /// is rebuilt.
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
