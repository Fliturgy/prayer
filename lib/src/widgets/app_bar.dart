import 'package:flutter/material.dart';

class PrayerAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The PrayerAppBar class is a widget that represents the app bar.
  final String title;
  final bool hasBackButton;

  @override
  final Size preferredSize;

  PrayerAppBar(
    this.title, {
    super.key,
    this.hasBackButton = false,
  }) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    /// The build method is a lifecycle method that is called when the widget
    /// is rebuilt.
    return AppBar(
      centerTitle: true,
      leading: hasBackButton
          ? BackButton(
              color: Theme.of(context).primaryColor,
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.favorite_border),
        //   onPressed: () {},
        // ),
      ],
      title: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
