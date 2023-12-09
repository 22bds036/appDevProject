import 'dart:typed_data';

import 'package:app_dev_project/models/charity.dart';
import 'package:app_dev_project/models/donation.dart';
import 'package:app_dev_project/models/user.dart' as model;
import 'package:app_dev_project/resources/storage_methods.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
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

        String? fcmToken = await _firebaseMessaging.getToken();

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          username: username,
          phone: phone,
          fcmToken: fcmToken!,
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
    final userData =
        snapshot.docs.map((e) => Donations.fromSnapshot(e)).toList();
    return userData;
  }

  Future<String> signUpcharity({
    required String email,
    required String password,
    required String charityname,
    required String phone,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          charityname.isNotEmpty ||
          phone.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        String? fcmToken = await _firebaseMessaging.getToken();

        Charity user = Charity(
          email: email,
          uid: cred.user!.uid,
          charityname: charityname,
          phone: phone,
          photoUrl: photoUrl,
          fcmToken: fcmToken!,
        );
        await _firestore
            .collection('charity')
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

  Future<String> loginCharity({
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

  Future<String?> getCharityFCMToken(String charityUID) async {
    DocumentSnapshot charitySnapshot = await FirebaseFirestore.instance
        .collection('charity')
        .doc(charityUID)
        .get();

    if (charitySnapshot.exists) {
      // Assuming 'fcmToken' is the field name in Firestore
      return (charitySnapshot.data() as Map<String, dynamic>)['fcmToken'];
    } else {
      return null; // Charity not found
    }
  }
}
