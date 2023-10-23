import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/animatedCrossFade.dart';
import 'widgets/animatedContainer.dart';
import 'widgets/animatedOpacity.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get flexibleSpace => null;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainerWidget(),
            Divider(),
            AnimatedCrossFadeWidget(),
            Divider(),
            AnimatedOpacityWidget(),
          ],
        ),
      ),
    );
  }
}
