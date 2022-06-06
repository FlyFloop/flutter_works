import 'package:flutter/material.dart';
import 'package:fluttor_tutorial/101/icon_learn.dart';
import 'package:fluttor_tutorial/101/image_learn.dart';
import 'package:fluttor_tutorial/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController();
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('$_currentPageIndex'),
          ),
          const Spacer(),
          FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility.duration_one,
                    curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_left)),
          FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: _DurationUtility.duration_one,
                    curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_right))
        ],
      ),
      body: PageView(
        // controller: PageController(
        //     viewportFraction: 0.6 //diğer sayfanın önizlemesini getirir
        //     ),
        controller: _pageController,
        onPageChanged: (int index) {
          _updatePageIndex(index);
        },
        children: [
          ImageLearn(),
          IconLearn(),
          StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const duration_one = Duration(seconds: 1);
}
