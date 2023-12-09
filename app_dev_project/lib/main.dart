import 'package:app_dev_project/firebase_options.dart';
import 'package:app_dev_project/screens/charity/charity_home_page.dart';
import 'package:app_dev_project/screens/charity/charity_loginpage.dart';
import 'package:app_dev_project/screens/donor/donor_home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_project/screens/donor/donor_loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:app_dev_project/screens/charity/charity_sign_up_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'screens/donor/donor_sign_up_screen.dart';
// import 'homePage/home_page2.dart';
// import 'screens/donor/donor_login_screen.dart';

/*

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // if (!kIsWeb) {
  //   await setupFlutterNotifications();
  // }
  runApp(const MyApp());
}

bool isCharity = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Donation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (isCharity){
                return const CharityHomePageScreen();
              }
              else {
                return const HomePageScreen();
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const LoginPage();
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/*
class _LoginPageState extends State<LoginPage> {
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
*/

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 21, 162),
      appBar: AppBar(
        title: const Text('Food Donation',
            style: TextStyle(
                color: Color.fromARGB(255, 63, 21, 162),
                fontWeight: FontWeight.bold,
                fontSize: 23)
                ),
        backgroundColor: const Color.fromARGB(255, 78, 246, 6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/arrow.jpg',
              height: 250,
              width: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose your category to get started!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
//! DONOR
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DonorLoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 246, 6),
                foregroundColor: Colors.white,
                minimumSize: const Size(250, 50),
                // shape: const RoundedRectangleBorder(side: BorderSide.none),
              ),
              child: const Text(
                'DONOR',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 63, 21, 162)),
              ),
            ),
            const SizedBox(height: 20),
//! CHARITY
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCharity = true;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharityLoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 246, 6),
                foregroundColor: Colors.white,
                minimumSize: const Size(250, 50),
              ),
              child: const Text(
                'CHARITY',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 63, 21, 162)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
