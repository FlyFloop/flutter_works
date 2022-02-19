import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
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
              SizedBox(
                height: 5,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                    isObscure: false),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: TextInputField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.lock,
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
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(child: Text('Login')),
                ),
                onTap: () {
                  print('login user');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ),
                    onTap: () {
                      print('registering user');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
