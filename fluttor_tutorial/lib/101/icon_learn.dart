import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  IconLearn({Key? key}) : super(key: key);
  final IconSizes _iconSizes = IconSizes();
  final IconColors _iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Learn'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.outlined_flag,
            color: _iconColors.froly,
            size: _iconSizes.iconSmall,
          )
        ]),
      ),
    );
  }
}

class IconSizes {
  double iconSmall = 40;
}

class IconColors {
  final Color froly = Color(0xffEE6E73);
}
