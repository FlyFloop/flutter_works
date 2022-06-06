import 'package:flutter/material.dart';
import 'package:fluttor_tutorial/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const RandomImage(),
              dense: true, //olabildiğince sıkıştırıyor padding siliyor
              onTap: () {},
              subtitle: Text('how do you use your card'),
              leading: Icon(Icons.money),
              trailing: Icon(Icons.send),
            )
          ],
        ),
      ),
    );
  }
}
