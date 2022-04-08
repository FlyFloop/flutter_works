import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tinder_clone/repositories/constants.dart';

class UserRepository {
  UserRepository();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isFirstTime(String userId) async {
    late bool exist;
    await _firestore.collection('users').doc(userId).get().then((user) {
      exist = user.exists;
    });
    return exist;
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
    // return _firebaseAuth.currentUser!.uid;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  Future<String> getUser() async {
    if (_firebaseAuth.currentUser == null) {
      return "null";
    } else {
      return _firebaseAuth.currentUser!.uid;
    }
  }

  //profile setup
  Future<void> profileSetup(
      File photo,
      String userId,
      String name,
      String gender,
      String interestedIn,
      DateTime age,
      GeoPoint location) async {
    /*
        await FirebaseStorage.instance
        .ref()
        .child('usersPhoto')
        .child(userId)
        .child(userId)
        .putFile(photo).then((p0) async => {
          await p0.ref.getDownloadURL().then((value) async {
            await _firestore.collection('users').doc(userId).set(
              {
                'uid': userId,
                'photoUrl':value,
                'name': name,
                'location':location,
                'gender',gender,
                'interestedIn',interestedIn,
                'age',age
              }
            )
          })
        }
        )
        */
  }
}
