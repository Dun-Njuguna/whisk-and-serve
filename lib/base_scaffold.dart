import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
