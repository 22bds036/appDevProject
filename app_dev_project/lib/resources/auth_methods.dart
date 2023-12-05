import 'package:app_dev_project/models/donation.dart';
import 'package:app_dev_project/models/user.dart' as model;

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!; // firebase User

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //! sign up user
  Future<String> signUpuser({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phone.isNotEmpty) {
        //registering user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          username: username,
          phone: phone,
        );
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> donateUser({
    required DateTime date,
    required String charityName,
    required Map<String, int> foodMap,
  }) async {
    String res = "some arror occured";
    try {
      Donations donations = Donations(
          date: DateTime.now(), charityName: charityName, foodMap: foodMap);

      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('donations')
          .doc()
          .set(donations.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<List<Donations>> allDonations() async {
    final snapshot = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('donations')
        .get();
    final userData = snapshot.docs.map((e) => Donations.fromSnapshot(e)).toList();
    return userData;
  }
}
