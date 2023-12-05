// app_info_screen.dart

import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 30, 5, 5),
      foregroundColor: Colors.white,
        title: const Text(
              'Motto',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,),
            ),

      ),
      body:  SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 19, 8, 227), Color.fromARGB(255, 87, 161, 221)],
          )),
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 10),
              Text(
                '    This app is designed to reduce the part of food waste by donating excess food of your house or your organizations to the nearby orphanages. It is also for the persons who are willing to donate food to needy people or ophanages, as an intermediate we created this platform. Lets join hands to reduce food waste and hunger. Lets be a part of it. "CARE WITH SHARE!".',
                style: TextStyle(fontSize: 19,
              color: Colors.white),
              ),
              // Add more information about the app as needed
            ],
          ),
        ),
      ),
    );
  }
}
