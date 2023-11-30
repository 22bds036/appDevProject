import 'package:flutter/material.dart';
import 'donation.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  final List<Donations> donationHistory;

  const HistoryScreen({Key? key, required this.donationHistory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Donation History:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: donationHistory.length,
                itemBuilder: (context, index) {
                  var donation = donationHistory[index];
                  return DonationBox(donation: donation);
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
