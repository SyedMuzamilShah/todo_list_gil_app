import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/styles/setting_view_style.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(SettingViewStyle.boxRadius),
            ),
            margin: EdgeInsets.symmetric(horizontal: SettingViewStyle.margin),
            padding: EdgeInsets.all(SettingViewStyle.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // dark mode
                Text(
                  "Dark Mode",
                  style: SettingViewStyle.textStyle(context),
                ),

                // switch
                Consumer<ThemeProvider>(builder: (_, provider, child) {
                  return CupertinoSwitch(
                    value: provider.isDarkMode,
                    onChanged: (value) => provider.toggleTheme(),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
