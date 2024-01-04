import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Nots> numbers = [];

  @override
  void initState() {
    super.initState();
    fetchNotsData();
  }

  Future<void> fetchNotsData() async {
    final response = await http.get(Uri.parse(dishUrl));

    if (response.statusCode == 200) {
      // Parse the JSON data
      List<dynamic> data = json.decode(response.body);
      List<Nots> fetchedNots = data.map((json) => Nots.fromJson(json)).toList();

      setState(() {
        numbers = fetchedNots;
      });
    } else {
      // Handle error
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          title: Text('Dashboard'),
        ),
        body: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      numbers[index].name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      ' ${numbers[index].category}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      ' ${numbers[index].price}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class Nots {
  final String ID;
  final String name;
  final String price;
  final String category;
  final String resturantId;

  Nots(
      {required this.ID,
      required this.name,
      required this.price,
      required this.category,
      required this.resturantId});

  factory Nots.fromJson(Map<String, dynamic> json) {
    return Nots(
      ID: json['ID'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      resturantId: json['resturantId'],
    );
  }
}
