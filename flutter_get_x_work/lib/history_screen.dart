import 'package:flutter/material.dart';
import 'package:flutter_get_x_work/constants.dart';
import 'package:flutter_get_x_work/widgets/record_list_tile.dart';

class history_screen extends StatefulWidget {
  const history_screen({Key? key}) : super(key: key);

  @override
  _history_screenState createState() => _history_screenState();
}

class _history_screenState extends State<history_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(historyScreenAppBarTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return record_list_tile();
        },
      ),
    );
  }
}
