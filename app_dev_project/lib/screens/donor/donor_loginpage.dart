import 'package:app_dev_project/screens/charity/charity_login_screen.dart';
import 'package:app_dev_project/screens/charity/charity_sign_up_screen.dart';
import 'package:app_dev_project/screens/donor/donor_sign_up_screen.dart';
import 'package:app_dev_project/screens/donor/donor_login_screen.dart';
import 'package:flutter/material.dart';

class DonorLoginPage extends StatelessWidget {
  const DonorLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      appBar: AppBar(
        title: const Text(
          'Food Donation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ClipOval(
            //     child: Image.asset(
            //   'images/welcome.jpg',
            //   alignment: Alignment.topCenter,
            //   height: 300,
            //   width: 300,
            // )),
            const Text(
              'Care with Share!', //lets share the joy!
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 21, 162)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
//! LOGIN
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 87, 70, 129),
                minimumSize: const Size(300, 40),
              ),
              onPressed: () {
                // Navigate to login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
//! SIGN UP
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 63, 21, 162),
                foregroundColor: Colors.white,
                minimumSize: const Size(300, 40),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DonorSignupScreen()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}