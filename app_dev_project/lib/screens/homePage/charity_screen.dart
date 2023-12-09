// import 'dart:convert';

import 'dart:convert';

import 'package:app_dev_project/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_dev_project/resources/auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../models/donation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'confirmation_screen.dart';

class CharityScreen extends StatefulWidget {
  final String charityName;
  final String imageAssetPath;
  final String fcmToken;

  CharityScreen({
    Key? key,
    required this.charityName,
    required this.imageAssetPath,
    required this.fcmToken,
  }) : super(key: key);

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

var _messageCount = 0;
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}

class _CharityScreenState extends State<CharityScreen> {
  bool _isLoading = false;
  String title =
      "New Donation! A new donation has been made by donor X. Check details!";
  String body = "this is the body";
  String? mtoken = "";
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();
  String username = "";
  String phone = "";
  List<Donations> donationHistory = [];
  String foodType = '';
  int cquantity = 0;
  int uquantity = 0;
  int wquantity = 0;
  final String _token = "widget.fcmToken"; //! check
  // get flutterLocalNotificationsPlugin => null;

  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  void updateCQuantity(int value) {
    setState(() {
      cquantity = value;
    });
  }

  void updateUQuantity(int value) {
    setState(() {
      uquantity = value;
    });
  }

  void updateWQuantity(int value) {
    setState(() {
      wquantity = value;
    });
  }

  void donateUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().donateUser(
        date: DateTime.now(),
        charityName: widget.charityName,
        foodMap: {
          'Cooked': cquantity,
          'Uncooked': uquantity,
          'Water': wquantity,
        });

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(donations: {
            'Cooked': cquantity,
            'Uncooked': uquantity,
            'Water': wquantity,
          }, donationHistory: donationHistory),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.charityName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 5, 5),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.white],
        )),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageAssetPath,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            const Text(
              'Donation Food Type:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Cooked',
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (cquantity > 0) {
                                updateCQuantity(cquantity - 1);
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            cquantity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              updateCQuantity(cquantity + 1);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          const Text(
                            'Uncooked',
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (uquantity > 0) {
                                updateUQuantity(uquantity - 1);
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            uquantity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              updateUQuantity(uquantity + 1);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          const Text(
                            'Water',
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (wquantity > 0) {
                                updateWQuantity(wquantity - 1);
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            wquantity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              updateWQuantity(wquantity + 1);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                int totalQuantity = cquantity + uquantity + wquantity;
                if (totalQuantity >= 7) {
                  donateUser();
                } else {
                  showSnackBar(
                      "Please select a minimum of 7 quantities!", context);

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Please select a minimum of 5 quantities.'),
                  //     backgroundColor: Colors.red,
                  //   ),
                  // );
                }
              },
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Donate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
