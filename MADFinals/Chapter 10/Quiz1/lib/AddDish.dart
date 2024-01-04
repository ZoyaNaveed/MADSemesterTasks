import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config.dart';
import 'package:flutter_application_1/MainScreen.dart';
import 'package:http/http.dart' as http;

class DishInformation extends StatefulWidget {
  const DishInformation({super.key});

  @override
  State<DishInformation> createState() => _DishInformationState();
}

class _DishInformationState extends State<DishInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController restaurantIdController = TextEditingController();
  String? selectedCategory;
  String? availability;

  // Sample category data
  final List<String> categories = ['Appetizer', 'Main Course', 'Dessert'];

  Future<void> submitForm() async {
    try {
      if (idController.text.isNotEmpty && nameController.text.isNotEmpty) {
        var regBody = {
          "ID": idController.text,
          "name": nameController.text,
          "price": priceController.text,
          "category": selectedCategory!,
          "resturantId": restaurantIdController.text
        };
        var response = await http.post(Uri.parse(dishUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody));
        if (response.statusCode == 201) {
          // Course added successfully
          print('Dish added successfully');
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => AssignmentsPage()));
        }
      }
    } catch (error) {
      // Handle any exceptions that occur during the HTTP request
      print('Error adding Dish: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          title: Text('Dish Information'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: 'Dish ID',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Dish ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Price';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Available',
                      groupValue: availability,
                      onChanged: (value) {
                        setState(() {
                          availability = value.toString();
                        });
                      },
                    ),
                    Text('Available'),
                    SizedBox(width: 20),
                    Radio(
                      value: 'Not Available',
                      groupValue: availability,
                      onChanged: (value) {
                        setState(() {
                          availability = value.toString();
                        });
                      },
                    ),
                    Text('Not Available'),
                  ],
                ),
                TextFormField(
                  controller: restaurantIdController,
                  decoration: InputDecoration(
                    labelText: 'Restaurant ID',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Restaurant ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Category',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
