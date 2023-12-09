import 'package:app_dev_project/main.dart';
import 'package:app_dev_project/screens/app_info.dart';
import 'package:app_dev_project/screens/history_screen.dart';
import 'package:app_dev_project/screens/donor/donor_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../homePage/donate_screen.dart';

class HomePageScreen extends StatefulWidget {
  
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });

  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 30, 5, 5),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppInfoScreen()
            ),
          );
            },
            icon: const Icon(Icons.info_outline),
            color: Colors.white,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 63, 21, 162),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/user_icon.png'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    username,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
                  ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('Your Profile'),
        onTap: () {
          // Handle 'Your Profile' button click
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen()
            ),
          );
             },
           ),
  //! Settings
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle 'Settings' button click
              },
            ),
  //! Logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/user_icon.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome $username!',
                style: TextStyle(fontSize: 21,
                color: Colors.indigoAccent.shade700,
                fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
        //! Donate
              ElevatedButton(
                onPressed: () {
                  // Handle 'Donate' button click
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DonateScreen()),
                    );
                },
                child: Text(
                  'Donate',
                  style: TextStyle(
                      fontSize: 18, color: Colors.indigoAccent.shade700),
                ),
              ),
              const SizedBox(height: 10),
        //! History
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoryScreen(),
                        ),
                      );
                },
                child: Text(
                  'History',
                  style: TextStyle(
                      fontSize: 18, color: Colors.indigoAccent.shade700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
