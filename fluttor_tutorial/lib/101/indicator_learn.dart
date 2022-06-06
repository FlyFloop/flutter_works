import 'package:flutter/material.dart';

/*
uygulama ilk çalıştığında loading state de auth izinleri kontrol eder(token etc..)
internettten veriler gelene kadar kullanıcıya bir şey göstermemiz gerekir ve bunlardan biri
indicator
*/
class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CenterCircularIndicator(
            color: Colors.red,
          )
        ],
      ),
      body: CenterCircularIndicator(
        color: Colors.red,
      ),
    );
  }
}

class CenterCircularIndicator extends StatelessWidget {
  CenterCircularIndicator({
    Key? key,
    this.color,
  }) : super(key: key);
  final color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        value: 0.2, //servisten data gelirken yüzde progres gösterme
        backgroundColor: Colors.white,
      ),
    );
  }
}
