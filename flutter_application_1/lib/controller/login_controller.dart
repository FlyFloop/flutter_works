import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/controller_consts.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/screens/profile_screen.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Successfully login', 'You have successfully login');
          Get.to(() => MainPage());
        });
      } else {
        Get.snackbar('Error fields!', 'Please fill all the fields');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error while loginnig  ', e.toString());
    }
  }
}
