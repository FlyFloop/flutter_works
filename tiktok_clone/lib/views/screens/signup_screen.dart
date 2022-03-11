import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/login_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiktok Clone',
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Signup',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.black,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                ),
                Positioned(
                    left: 80,
                    bottom: -10,
                    child: IconButton(
                      onPressed: () => authController.pickImage(),
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                  controller: _usernameController,
                  icon: Icons.person,
                  labelText: 'Username',
                  isObscure: false),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                  controller: _emailController,
                  icon: Icons.mail,
                  labelText: 'Email',
                  isObscure: false),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  labelText: 'Password',
                  isObscure: true),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor),
                child: const Center(
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              // ignore: avoid_print
              onTap: () => authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  authController.profilePhoto),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: buttonColor),
                  ),
                  // ignore: avoid_print
                  onTap: () => Get.to(() => LoginScreen()),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    ));
  }
}
