import 'package:flutter/material.dart';
import 'package:whisk_and_serve/router/custom_nav_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
