import 'package:flutter/material.dart';
import 'package:tinder_clone/ui/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        child: Center(
          child: Text(
            'Tinder Clone',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
