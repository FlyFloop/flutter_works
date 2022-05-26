import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: PngImage(
                path: ProjectsImage.f40,
              ),
            ),
            Image.network(
                'https://www.automagg.com/wp-content/uploads/2017/02/Ferrari812Superfast_4.jpg')
          ],
        ),
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  const PngImage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}

class ProjectsImage {
  static const String f40 = 'assets/f40.png';
}
