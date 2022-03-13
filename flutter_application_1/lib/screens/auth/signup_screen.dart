import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets/signup_textfield.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print('logo tapped');
              },
              child: CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
            ),
          ),
          SignupTextField(
            controller: _usernameController,
            hintText: 'Enter your username',
            isObscure: false,
          ),
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
              onTap: () {
                print('signupworks');
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height / 20,
                decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                child: Center(
                  child: Text('Signup',
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
                Text('Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    )),
                const SizedBox(width: 2),
                InkWell(
                  onTap: () {
                    print('loginworks');
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.blueAccent[100],
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
