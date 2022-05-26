import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          cardWidget(
            child: Text('Alper'),
          )
        ],
      )),
    );
  }
}

// ignore: camel_case_types
class cardWidget extends StatelessWidget {
  cardWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  /*
  Custom card ise sadece card içermeli diğer her şey dışarıdan alınmalı
  */
  final Widget child;
  final roundedRectangle =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      margin: ProjectMargins.cardMargin,
      color: Theme.of(context).colorScheme.error,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}
/*
borders:
StadiumBorder
CirculerBorder
RoundedRectangleBorder
*/

