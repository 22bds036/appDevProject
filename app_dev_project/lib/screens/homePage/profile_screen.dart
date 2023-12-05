// import 'package:flutter/material.dart';

// class YourProfileScreen extends StatelessWidget {
//   final String name;
//   final String email;
//   final String phoneNumber;

//   // Add more properties as needed

//   const YourProfileScreen({
//     Key? key,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     // Add more properties as needed
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Profile'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Name: $name'),
//             Text('Email: $email'),
//             Text('Phone Number: $phoneNumber'),
//             // Add more Text widgets for additional properties
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _addressController = TextEditingController();
  String username = "";
  String phone = "";
  String email = "";
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Fetch user details from Firestore
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      setState(() {
        username = (snapshot.data() as Map<String, dynamic>)['username'];
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
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'address': _addressController.text});

      setState(() {
        isEditing = false;
      });

      // Optionally, you can show a success message or navigate back
    } catch (e) {
      print("Error saving address: $e");
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Profile',
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
          colors: [Colors.white, Colors.blue],
        )),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Username: $username',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone number: $phone',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              'E-mail ID: $email',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 10),
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
