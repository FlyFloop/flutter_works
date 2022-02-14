import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Example_One extends StatefulWidget {
  const Shared_Example_One({Key? key}) : super(key: key);

  @override
  _Shared_Example_OneState createState() => _Shared_Example_OneState();
}

class _Shared_Example_OneState extends State<Shared_Example_One> {
  String _haveStarted3Times = '';

  Future<int> _getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startupNumber');
    if (startupNumber == null) {
      return 0;
    }
    return startupNumber;
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
  }

  Future<void> _incrementStartup() async {
    final prefs = await SharedPreferences.getInstance();
    int lastStartupNumber = await _getIntFromSharedPref();
    int cureentStartupNumber = ++lastStartupNumber;
    await prefs.setInt('startupNumber', cureentStartupNumber);
    if (cureentStartupNumber == 3) {
      setState(() {
        _haveStarted3Times = '$cureentStartupNumber times completed';
      });
      await _resetCounter();
    } else {
      setState(() {
        _haveStarted3Times = '$cureentStartupNumber times completed';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementStartup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _haveStarted3Times,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
