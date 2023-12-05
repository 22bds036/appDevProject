import 'package:app_dev_project/utils.dart';

import 'package:app_dev_project/resources/auth_methods.dart';
import '../../models/donation.dart';
import 'package:flutter/material.dart';

import 'confirmation_screen.dart';

class CharityScreen extends StatefulWidget {
  final String charityName;
  final String imageAssetPath;

  const CharityScreen({
    Key? key,
    required this.charityName,
    required this.imageAssetPath,
  }) : super(key: key);

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  bool _isLoading = false;

  List<Donations> donationHistory = [
    // Donations(date: DateTime.now(), charityName: 'Harsha', foodMap: {
    //   'Cooked': 4,
    //   'Uncooked': 4,
    //   'Water': 4,
    // }),
    // Donations(date: DateTime.now(), charityName: 'Madhan', foodMap: {
    //   'Cooked': 7,
    //   'Uncooked': 7,
    //   'Water': 7,
    // })
  ];
  String foodType = '';
  int cquantity = 0;
  int uquantity = 0;
  int wquantity = 0;

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
            FittedBox(
              child: Image.asset(
                widget.imageAssetPath,
              ),
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
                if (totalQuantity >= 5) {
                  donateUser();
                } else {
                  showSnackBar(
                      "Please select a minimum of 5 quantities!", context);

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
