import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(), //ekranda boş bir alan verir
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ), //50'lik bir kare
          Container(
            width: 50,
            height: 50,
            constraints: const BoxConstraints(
              maxWidth: 100,
              minWidth: 50,
              maxHeight: 100,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('AA' * 100),
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      border: Border.all(width: 10, color: Colors.white),
      color: Colors.red,
      shape: BoxShape.circle);
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            border: Border.all(width: 10, color: Colors.white),
            color: Colors.red,
            shape: BoxShape.circle);
}
