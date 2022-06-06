import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);
  /* column widgetları alt alta row yan yana çizer 
  expanded ekranı böler 
  expanded sadece row ve columnlarda kullanılır?
  flex ise bölme oranlarını belirler
  spacearound etrafında boşluk verip böler
  spacebetween direk en uçlara böler
  spaceEvenly olabildiğinde az aralık bırakmaya çalışıyor
  flutter expanded ve height kullanılan yerde önce heighta bakar ve ardından
  kalan boşluğa göre expandedı böler
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: FlutterLogo()),
          Expanded(flex: 2, child: FlutterLogo()),
          Expanded(flex: 2, child: FlutterLogo()),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
