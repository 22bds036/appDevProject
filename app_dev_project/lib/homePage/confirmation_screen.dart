import 'package:app_dev_project/donation.dart';
import 'package:flutter/material.dart';

import '../history_screen.dart';

// ignore: must_be_immutable
class ConfirmationScreen extends StatelessWidget {
  final Map<String, int> donations;
  List<Donations> donationHistory = [];
  ConfirmationScreen(
      {Key? key, required this.donations, required this.donationHistory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor:  const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          )
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              'You are a Donor now!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            )),
            const SizedBox(height: 10),
            const Text(
              'Donations:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: donations.entries.map((entry) {
                return ListTile(
                  focusColor: Colors.blue,
                  title: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    entry.value.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 63, 21, 162),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(200, 40),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/donate_screen');
                    },
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 63, 21, 162),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(200, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoryScreen(donationHistory: donationHistory),
                        ),
                      );
                    },
                    child: const Text(
                      'Show History',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
