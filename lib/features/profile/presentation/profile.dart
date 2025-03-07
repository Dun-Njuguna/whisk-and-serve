import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisk_and_serve_core/theme/theme_provider.dart';
import 'package:whisk_and_serve_core/widgets/base_scaffold.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Settings",
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16.0,
          MediaQuery.of(context).padding.top + 32.0, // Adjust for notch
          16.0,
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appearance Section
            Text(
              "Appearance",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            // Theme Selection
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: ThemeMode.values.map((mode) {
                        return RadioListTile<ThemeMode>(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          title: Text(
                            mode == ThemeMode.light
                                ? "Light"
                                : mode == ThemeMode.dark
                                    ? "Dark"
                                    : "System",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          value: mode,
                          groupValue: themeProvider.themeMode,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (newTheme) {
                            if (newTheme != null) {
                              themeProvider.setThemeMode(newTheme);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
