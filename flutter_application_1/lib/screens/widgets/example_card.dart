import 'package:flutter/cupertino.dart';

class ExampleCard extends StatelessWidget {
  //final String image;

  const ExampleCard({
    Key? key,
    //  required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Image.network(
        'https://picsum.photos/200',
        fit: BoxFit.fill,
      ),
    );
  }
}
