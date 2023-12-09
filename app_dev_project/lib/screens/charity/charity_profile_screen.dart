
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CharityProfileScreen extends StatefulWidget {
  const CharityProfileScreen({Key? key}) : super(key: key);

  @override
  _CharityProfileScreenState createState() => _CharityProfileScreenState();
}

class _CharityProfileScreenState extends State<CharityProfileScreen> {
  final TextEditingController _addressController = TextEditingController();
  String charityname = "";
  String phone = "";
  String email = "";
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    fetchCharityDetails();
  }

  void fetchCharityDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('charity')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      setState(() {
        charityname = (snapshot.data() as Map<String, dynamic>)['charityname'];
      });

      setState(() {
        phone = (snapshot.data() as Map<String, dynamic>)['phone'];
      });

      setState(() {
        email = (snapshot.data() as Map<String, dynamic>)['email'];
      });
      setState(() {
        // Set user details
        _addressController.text = snapshot['address'] ?? '';
      });
    } catch (e) {
      print("Error fetching user details: $e");
      // Handle error
    }
  }

  void saveAddress() async {
    try {
      await FirebaseFirestore.instance
          .collection('charity')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'address': _addressController.text});

      setState(() {
        isEditing = false;
      });

    } catch (e) {
      print("Error saving address: $e");
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Charity\'s Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color.fromARGB(255, 63, 21, 162)],
        )),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Charity Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              'Charity name: $charityname',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            Text(
              'Phone number: $phone',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            Text(
              'E-mail ID: $email',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: isEditing
                      ? TextFormField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(),
                          ),
                        )
                      : Text(
                          'Address: ${_addressController.text}',
                          style: const TextStyle(fontSize: 17),
                        ),
                ),
                IconButton(
                  icon: Icon(isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                    if (isEditing) {
                      // You can perform some action when edit mode is enabled
                    } else {
                      // Save the address
                      saveAddress();
                    }
                    
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}