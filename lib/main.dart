import 'package:flutter/material.dart';
import 'package:whisk_and_serve/core/theme/theme.dart';
import 'package:whisk_and_serve/features/widgets/base_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme, // Apply light theme
      darkTheme: AppThemes.darkTheme, // Apply dark theme
      themeMode: ThemeMode
          .system, // Use system theme (auto switch between light and dark)
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => {},
              child: const Text("App"),
            ),
          ],
        ),
      ),
    );
  }
}
