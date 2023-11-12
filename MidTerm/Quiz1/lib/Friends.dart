import 'package:flutter/material.dart';
import 'package:flutter_application_1/UserPage.dart';
import 'package:flutter_application_1/main.dart';

class Person {
  final String name;
  final String email;
  final String profileImage;

  Person(this.name, this.email, this.profileImage);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendsPage(),
    );
  }
}

class FriendsPage extends StatelessWidget {
  final List<Person> people = [
    Person('John Doe', 'john@example.com', 'assets/images/cab.png'),
    Person('Jane Smith', 'jane@example.com', 'assets/images/pickicon.png'),
    Person('Bob Johnson', 'bob@example.com', 'assets/images/bike.png'),
    // Add more people as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(people[index].profileImage),
            ),
            title: Text(people[index].name),
            subtitle: Text(people[index].email),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Create a DetailsPage for more information about a person
class DetailsPage extends StatelessWidget {
  final Person person;

  DetailsPage(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(person.profileImage),
          ),
          Text(person.name),
          Text(person.email),
          // Add more details as needed
        ],
      ),
    );
  }
}
