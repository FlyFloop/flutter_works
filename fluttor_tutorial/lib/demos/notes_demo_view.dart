import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../101/image_learn.dart';

class NotesDemoView extends StatelessWidget {
  const NotesDemoView({Key? key}) : super(key: key);
  final String title = 'Create Your First car';
  final String subTitle = 'Add a car';
  // ignore: non_constant_identifier_names
  final String create_a_car = 'Create Your First Car';
  // ignore: non_constant_identifier_names
  final String import_cars = 'Import cars';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            const PngImage(
              path: ProjectsImage.f40,
            ),
            titleWidget(title: title),
            titleWidget(title: subTitle),
            const Spacer(),
            createMethod(context),
            textMethod(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  TextButton textMethod() =>
      TextButton(onPressed: () {}, child: Text(import_cars));

  SizedBox createMethod(BuildContext context) {
    return SizedBox(
      height: ButtonHeights.buttonNormalHeight,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            create_a_car,
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }
}

class titleWidget extends StatelessWidget {
  const titleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}

class PaddingItems {
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}
