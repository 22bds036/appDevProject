import 'package:flutter/material.dart';


class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(
                color: Color.fromARGB(255, 63, 21, 162),
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/arrow.jpg',
              height: 250,
              width: 300,
            ),
            const Text(
              'Choose your category to get started',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
//! DONOR
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DonorSignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 246, 6),
                foregroundColor: Colors.white,
                minimumSize: const Size(250, 50),
                // shape: const RoundedRectangleBorder(side: BorderSide.none),
              ),
              child: const Text(
                'DONOR',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
//! CHARITY
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharitySignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 246, 6),
                foregroundColor: Colors.white,
                minimumSize: const Size(250, 50),
              ),
              child: const Text(
                'CHARITY',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
