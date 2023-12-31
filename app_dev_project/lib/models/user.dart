import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String phone;
  final String fcmToken;

  User({
    required this.email,
    required this.uid,
    required this.username,
    required this.phone,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "phone": phone,
        "fcmToken": fcmToken,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot['email'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        phone: snapshot['phone'],
        fcmToken: snapshot['fcmToken'],
        );
  }
}
