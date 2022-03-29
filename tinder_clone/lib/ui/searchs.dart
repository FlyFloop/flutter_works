import 'package:flutter/material.dart';

class Searches extends StatefulWidget {
  const Searches({Key? key}) : super(key: key);

  @override
  State<Searches> createState() => _SearchesState();
}

class _SearchesState extends State<Searches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Searches'),
      ),
    );
  }
}
