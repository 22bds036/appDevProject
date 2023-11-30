import 'package:flutter/material.dart';

import 'homePage/charity_screen.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'Donate',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 30, 5, 5),
        
      ),
      // drawer: SafeArea(
      //   child: Drawer(
      //     child: Column(
      //       children: [
      //         const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //           ),
      //           child: ListTile(
      //             title: Text(
      //               'Flutter Map!',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20.0,
      //               ),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           onTap: () {},
      //           leading: const Icon(Icons.settings),
      //           title: const Text('Settings'),
      //         ),
      //         ListTile(
      //           onTap: () {
      //             Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return const LoginPage();
      //                 },
      //               ),
      //             );
      //           },
      //           leading: const Icon(Icons.logout),
      //           title: const Text('Logout'),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
        //! FIRST GESTURE
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharityScreen(
                        charityName: 'Give India Foundation',
                        imageAssetPath: 'images/giveIndia.png',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(
                            2,
                            2,
                          ),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/giveIndia.png',
                        fit: BoxFit.cover,
                      ),
                      const ListTile(
                        title: Text('Give India Foundation',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
                ),
              ),
      
              const SizedBox(
                height: 10,
              ),
      
              //! SECOND GESTURE
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharityScreen(
                        charityName: 'Annamrita Foundations',
                        imageAssetPath: 'images/annamrita(2).png',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(
                            2,
                            2,
                          ),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/annamrita(2).png',
                        fit: BoxFit.cover,
                      ),
                      const ListTile(
                        title: Text('Annamrita Foundations',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
      
              //! THIRD GESTURE
      
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharityScreen(
                        charityName: 'Akshaya Patra Foundation',
                        imageAssetPath: 'images/akshayaPatra.jpg',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(
                            2,
                            2,
                          ),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/akshayaPatra.jpg',
                        fit: BoxFit.cover,
                      ),
                      const ListTile(
                        title: Text('Akshaya Patra Foundation',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //! FOURTH GESTURE
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharityScreen(
                        charityName: 'Don Bosco Ashalayam',
                        imageAssetPath: 'images/donBosco.png',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(
                            2,
                            2,
                          ),
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/donBosco.png',
                        fit: BoxFit.cover,
                      ),
                      const ListTile(
                        title: Text('Don Bosco Ashalayam',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
