import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/donation.dart';
import 'package:intl/intl.dart';
import 'package:app_dev_project/resources/auth_methods.dart';

class HistoryScreen extends StatelessWidget {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  HistoryScreen({Key? key,})
      : super(key: key);

  Future<List<Donations>> allDonations() async {
    final snapshot = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('donations')
        .get();
    final userData = snapshot.docs.map((e) => Donations.fromSnapshot(e)).toList();
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation History:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue],
        )),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Donations>>(
                future: allDonations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Donations> donationHistory = snapshot.data!;
                    return ListView.builder(
                      itemCount: donationHistory.length,
                      itemBuilder: (context, index) {
                        var donation = donationHistory[index];
                        return DonationBox(donation: donation);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class DonationBox extends StatelessWidget {
  final Donations donation;

  const DonationBox({Key? key, required this.donation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Charity Name: ${donation.charityName}',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Date: ${DateFormat.yMMMd().format(donation.date)}',
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(height: 8),
          const Text(
            'Donated Food & Quantity:',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 4),
          Column(
            children: donation.foodMap.entries.map((entry) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                child: ListTile(
                  title: Text(
                    entry.key,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: Text(
                    entry.value.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
