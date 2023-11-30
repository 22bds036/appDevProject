import 'package:flutter/material.dart';

class YourProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;

  // Add more properties as needed

  const YourProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    // Add more properties as needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone Number: $phoneNumber'),
            // Add more Text widgets for additional properties
          ],
        ),
      ),
    );
  }
}
