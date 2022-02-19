import 'package:flutter/material.dart';
import 'package:flutter_get_x_work/constants.dart';

class graph_screen extends StatefulWidget {
  const graph_screen({Key? key}) : super(key: key);

  @override
  _graph_screenState createState() => _graph_screenState();
}

class _graph_screenState extends State<graph_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(graphScreenAppBarTitle),
        centerTitle: true,
      ),
      body: Center(child: Text('Graph Screen')),
    );
  }
}
