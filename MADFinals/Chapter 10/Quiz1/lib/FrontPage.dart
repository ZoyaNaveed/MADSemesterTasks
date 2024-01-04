import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart';
import 'package:flutter_application_1/SignUp.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Food delivering app',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Pizza.png', // Replace with your image asset path
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Login'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => SignPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
