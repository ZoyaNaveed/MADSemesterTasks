import 'package:flutter/material.dart';
import 'package:flutter_application_1/Friends.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Rounded container with username icon and lock icon
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    children: [
                      // Username field with username icon
                      Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Password field with lock icon
                      Row(
                        children: [
                          Icon(Icons.lock),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Arrows to go to another page
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendsPage(),
                  ),
                );
              },
            ),
            // Forget password text
            Text(
              'Forgot password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Register here',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                height: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
