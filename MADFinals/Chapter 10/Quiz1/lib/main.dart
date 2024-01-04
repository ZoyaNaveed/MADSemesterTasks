import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddDish.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/FrontPage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue[900],
        ),
        routes: {
          '/dish': (context) => DishInformation(),
          '/dashboard': (context) => Dashboard(),
        },
        home: FrontPage());
  }
}
