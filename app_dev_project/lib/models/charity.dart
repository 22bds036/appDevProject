import 'package:cloud_firestore/cloud_firestore.dart';

class Charity {
  final String email;
  final String uid;
  final String charityname;
  final String phone;
  final String photoUrl;
  final String fcmToken;

  Charity({
    required this.email,
    required this.uid,
    required this.charityname,
    required this.phone,
    required this.photoUrl,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        "charityname": charityname,
        "uid": uid,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
        "fcmToken": fcmToken,
      };

  static Charity fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Charity(
        email: snapshot['email'],
        uid: snapshot['uid'],
        charityname: snapshot['charityname'],
        phone: snapshot['phone'],
        photoUrl: snapshot['photoUrl'],
        fcmToken: snapshot['fcmToken']);
  }
}
