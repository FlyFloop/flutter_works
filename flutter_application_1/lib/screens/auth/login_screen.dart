import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/signup_controller.dart';
import 'package:flutter_application_1/screens/auth/signup_screen.dart';
import 'package:flutter_application_1/screens/widgets/reset_password_bottom_sheet.dart';
import 'package:flutter_application_1/screens/widgets/signup_textfield.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignupTextField(
            controller: _emailController,
            hintText: 'Enter your email',
            isObscure: false,
          ),
          SignupTextField(
            controller: _passwordController,
            hintText: 'Enter your password',
            isObscure: true,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => _loginController.loginUser(
                  _emailController.text, _passwordController.text),
              child: Container(
                width: size.width * 0.8,
                height: size.height / 20,
                decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                child: Center(
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    )),
                const SizedBox(width: 2),
                InkWell(
                  onTap: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text(' Signup',
                      style: TextStyle(
                          color: Colors.blueAccent[100],
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () => Get.bottomSheet(
                ResetPassword(),
              ),
              child: Text('Reset Password',
                  style: TextStyle(
                      color: Colors.blueAccent[100],
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ));
  }
}
