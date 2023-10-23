import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/gridviewbuildwidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const GridViewBuilderWidget(),
      ),
    );
  }
}
