import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key, this.userName}) : super(key: key);
  final String name = 'Alper';
  final String appButonTitle = 'Example App Bar';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CupertinoButton(
          //     child: Text(
          //       appButonTitle,
          //       style: ProjectTextStyle.welcomeStyle,
          //     ),
          //     onPressed: () {}),
          Center(
            child: Text('Welcome $name',
                maxLines: 2, //maksimum 2 satır
                overflow: TextOverflow
                    .ellipsis, //sığmayanlar 3nokta şeklinde görülcek
                textAlign: TextAlign.center,
                style: ProjectTextStyle.welcomeStyle),
          ),
          Text('Welcome $name',
              maxLines: 2, //maksimum 2 satır
              overflow:
                  TextOverflow.ellipsis, //sığmayanlar 3nokta şeklinde görülcek
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ProjectColors.welcomeColor)),
          Text(keys.welcome),
        ],
      ),
    );
  }
}

class ProjectTextStyle {
  static const welcomeStyle = TextStyle(
    decoration: TextDecoration.underline, //text altına çizgi çektik
    fontStyle: FontStyle.italic,
    wordSpacing: 2, //kelimeler arası boşluk
    letterSpacing: 2, //harfler arası boşluk
    color: Colors.red,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
