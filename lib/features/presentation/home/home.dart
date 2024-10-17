import 'package:flutter/material.dart';
import 'package:whisk_and_serve/features/widgets/base_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        child: Center(
      child: Text("home"),
    ));
  }
}
