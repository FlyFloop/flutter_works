import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 170,
          ),
          Container(
            color: Colors.white,
            height: 90,
          ),
          Container(
            color: Colors.black,
            height: 80,
          ),
          //hepsi birbirinin üstünde
        ],
      ),
    );
  }
}
