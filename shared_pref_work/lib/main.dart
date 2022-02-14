import 'package:flutter/material.dart';
import 'package:shared_pref_work/example_one/shared_pref_example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shared_Example_One(),
    );
  }
}
