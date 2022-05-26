import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({Key? key}) : super(key: key);
  final String name = 'Alper';
  final String surname = 'Yorgun';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TitleTextWidget(title: name),
            emptyBox(),
            TitleTextWidget(title: surname),
            emptyBox(),
            const _customContainer(),
            emptyBox(),
          ],
        ),
      ),
    );
  }

  SizedBox emptyBox() => const SizedBox(
        height: 10,
      );
}

//Basit işlerde method, kompleks işlerde widget olarak dışarı çıkartılmalı
//neredeyse bütün widgetları dışarıya çıkartarak yazmalıyız
/*
3 ana nokta:
kompleks arttığında parçalanmalı,
dışarıdan parametre alınabilir halde olmalı
sayfalar private olarak entegre edilebilme yetenğine sahip olmalı
*/
// ignore: camel_case_types
class _customContainer extends StatelessWidget {
  const _customContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red));
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
