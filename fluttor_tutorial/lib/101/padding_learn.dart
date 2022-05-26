import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);
/*
uygulamanın sağ ve sol paddingleri her yerde ortak olmalıdır
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: ProjectPadding.pagePaddingVertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(10.0), //heryerden 10 boşluk veriyor
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10), //dikey olarak 10 boşluk
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Padding(
                padding: ProjectPadding.pagePaddingRightOnly +
                    ProjectPadding.pagePaddingVertical,
                //hem sağdan 20 hemde dikey olarak 10 boşluk verdik ve + ile override ettik
                //sadece sağdan 20 bpşluk
                child: Text('Alper'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10.0);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
