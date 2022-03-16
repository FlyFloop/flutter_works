import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/controller_consts.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //signup user
  signupUser(
    String userName,
    String email,
    String password,
  ) async {
    try {
      if (userName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(
            name: userName, email: email, uid: userCredential.user!.uid);
        await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toJson())
            .then((value) {
          Get.snackbar(
              'Signup successfully', 'You have successfully signed up');
        });
      } else {
        Get.snackbar('Error creating account', 'Please fill all the fields');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error while registering app', e.toString());
    }
  }
}
