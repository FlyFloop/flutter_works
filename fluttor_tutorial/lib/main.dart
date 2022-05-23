import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttor_tutorial/101/appbar_learn.dart';
import 'package:fluttor_tutorial/101/button_learn.dart';
import 'package:fluttor_tutorial/101/container_sizedbox_learn.dart';
import 'package:fluttor_tutorial/101/icon_learn.dart';
import 'package:fluttor_tutorial/101/scaffold_learn.dart';
import 'package:fluttor_tutorial/101/text_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /*
    cupertinoapp daha ios yönelimli widgetlara sahip
    */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(

              //projedeki bütün appbarların ayarlarını yapıyoruz
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0)),
      title: 'Flutter Demo',
      home: IconLearn(),
    );
  }
}
