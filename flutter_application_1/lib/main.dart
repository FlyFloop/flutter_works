import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/reset_password_controller.dart';
import 'package:flutter_application_1/controller/signup_controller.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';
import 'package:flutter_application_1/screens/auth/signup_screen.dart';
import 'package:flutter_application_1/screens/screens/home_screen.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(SignupController());
    Get.put(LoginController());
    Get.put(ResetPasswordController());
  });
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}
