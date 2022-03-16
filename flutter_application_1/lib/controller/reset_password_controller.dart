import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controller_consts.dart';

class ResetPasswordController extends GetxController {
  resetPassword(String email) async {
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
          Get.snackbar('Successfully', 'Email sent successfully');
        });
      } else {
        Get.snackbar('Error', 'Please enter email',
            snackPosition: SnackPosition.TOP);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error reseting password', e.toString());
    }
  }
}
