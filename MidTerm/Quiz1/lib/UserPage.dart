import 'package:flutter/material.dart';
import 'package:flutter_application_1/Friends.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendsPage(),
                  ));
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Portfolio'),
              Tab(text: 'Skills'),
              Tab(text: 'Articles'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/images/cab.png'), // Replace with the actual user image
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '500', // Replace with actual follower count
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '300', // Replace with actual following count
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'User Name', // Replace with actual user name
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'User Info', // Replace with actual user info
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.umbrella,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.video_collection,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Portfolio Tab
                    Center(
                      child: Text(
                        'Portfolio Content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Skills Tab
                    Center(
                      child: Text(
                        'Skills Content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Articles Tab
                    Center(
                      child: Text(
                        'Articles Content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
