import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_get_x_work/constants.dart';
import 'package:flutter_get_x_work/home_screen.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  //telefondaki statusbar rengi ile uygulama rengini aynı yapmak için
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: materialAppTitle,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
