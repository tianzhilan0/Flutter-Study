import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;

    MyDrawer(
      {Key key,
      this.showPerformanceOverlay,
      this.onShowPerformanceOverlayChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        // Performance overlay toggle.
        ListTile(
          leading: Icon(Icons.assessment),
          title: Text('Performance Overlay'),
          onTap: () {
            onShowPerformanceOverlayChanged(!showPerformanceOverlay);
          },
          selected: showPerformanceOverlay,
          trailing: Checkbox(
            value: showPerformanceOverlay,
            onChanged: (bool value) {
              onShowPerformanceOverlayChanged(!showPerformanceOverlay);
            },
          ),
        ),
      ]),
    );
  }
}