import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/signup_controller.dart';
import 'package:flutter_application_1/screens/widgets/signup_textfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  SignupController _signupController = Get.put(SignupController());

  late int age;
  late String userGender;
  late String userLookingFor;
  late GeoPoint location;
  _getLocation() async {
    // Geolocator geolocator = Geolocator();
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      location = GeoPoint(position.latitude, position.longitude);
    } catch (e) {
      Get.snackbar('failed', e.toString());
    }
  }

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => _signupController.pickImage(),
                child: CircleAvatar(
                  child: Icon(Icons.access_alarm),
                  radius: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
            ),
            SignupTextField(
              controller: _nameController,
              hintText: 'Enter your Name',
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
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text('Enter Your Birthday'))),
                onTap: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime(
                        DateTime.now().year - 18,
                      ), onConfirm: (date) {
                    setState(() {
                      age = DateTime.now().year - date.year;
                    });
                    print(age);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('You Are:'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        userGender = 'Male';
                        print(userGender);
                      },
                      icon: Icon(Icons.male)),
                  IconButton(
                      onPressed: () {
                        userGender = 'Female';
                        print(userGender);
                      },
                      icon: Icon(Icons.female)),
                  IconButton(
                      onPressed: () {
                        userGender = 'Transgender';
                        print(userGender);
                      },
                      icon: Icon(Icons.transgender)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Looking for:'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        userLookingFor = 'Male';
                        print('user looking for' + userLookingFor);
                      },
                      icon: Icon(Icons.male)),
                  IconButton(
                      onPressed: () {
                        userLookingFor = 'Female';
                        print('user looking for' + userLookingFor);
                      },
                      icon: Icon(Icons.female)),
                  IconButton(
                      onPressed: () {
                        userLookingFor = 'Transgender';
                        print('user looking for' + userLookingFor);
                      },
                      icon: Icon(Icons.transgender)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => _signupController.signupUser(
                    _nameController.text,
                    _emailController.text,
                    _passwordController.text,
                    age.toString(),
                    _signupController.profilePhoto,
                    userGender,
                    userLookingFor,
                    location),
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
                      Get.to(() => LoginScreen());
                    },
                    child: Text(' Login',
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
      ),
    ));
  }
}
