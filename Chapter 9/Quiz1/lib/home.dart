import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/header.dart';
import 'package:flutter_application_1/widgets/row.dart';
import 'package:flutter_application_1/widgets/row_with_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return HeaderWidget(index: index);
          } else if (index >= 1 && index <= 3) {
            return RowWithCardWidget(index: index);
          } else {
            return RowWidget(index: index);
          }
        },
      )),
    );
  }
}
