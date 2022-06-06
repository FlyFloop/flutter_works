import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  /* 
  amaç custom widget ile her şeyin spesifik olarak ayarlanması
  colorsutiltyden türettik 
     style verirken temadan okumamız gerekiyor her şey dynamic olmalı
     bir custom widgetin içerdeki padding customwidget içinde dışındaki padding ise dışardan belirlenmeli
     dışarıdan verilen widget kesinlikle custom widget içinde özel classda verilmemeli
  */
  CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width, //buttonun dışarıdaki ölçükeri dışardaın verildi
              child: CustomFoodButton(
                title: title,
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              child: CustomFoodButton(
                onPressed: () {},
                title: title,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class _ColorsUtility {
  final redColor = Colors.red;
  final whiteColor = Colors.white;
}

class _FontUtility {
  final bold = FontWeight.bold;
}

class _PaddingUtility {
  final normalPadding = const EdgeInsets.all(8.0);
  final normal2xPadding = const EdgeInsets.all(16.0);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _FontUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  /*
  custom widget kendi özelliğini kaybetmemesi için onpressed özelliğini dışarıdan alıyoruz 
  */
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: redColor, shape: const StadiumBorder()),
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: whiteColor, fontWeight: bold),
        ),
      ),
    );
  }
}
