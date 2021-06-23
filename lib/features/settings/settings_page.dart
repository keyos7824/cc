import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'settings_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SettingsStore>(context);
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: store.themes[0],
              groupValue: store.currentTheme,
              onChanged: (ThemeData? newTheme) {
                store.currentTheme = newTheme!;
              },
              title: Text("Thème primaire"),
            ),
            RadioListTile(
              value: store.themes[1],
              groupValue: store.currentTheme,
              onChanged: (ThemeData? newTheme) {
                store.currentTheme = newTheme!;
              },
              title: Text("Thème secondaire"),
            ),
          ],
        );
      },
    );
  }
}
