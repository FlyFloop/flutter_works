import 'package:flutter/material.dart';
import 'package:fluttor_tutorial/product/language/language_items.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({Key? key}) : super(key: key);
  /*
  stateless gibi çalışır burası sadece dışarıdan data alır
   */
  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
  /*
  state hayatı burada belirlenir
  */
  int _count = 0;
  final _increment = 'Increment';
  int _visitCount = 0;
  void _incrementCount(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _count = _count + 1;
      });
    } else {
      _count = _count - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.hello),
      ),
      body: Center(
        child: Column(
          children: [
            countTextWidget(count: _count),
            incrementCountMethod(),
            const Placeholder(),
            _incrementMethod(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _incrementMethod() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            ++_visitCount;
          });
        },
        child: Text('Merhaba $_visitCount'));
  }

  ElevatedButton incrementCountMethod() {
    return ElevatedButton(
        onPressed: () => _incrementCount(true), child: Text(_increment));
  }
}

// ignore: camel_case_types
class countTextWidget extends StatelessWidget {
  const countTextWidget({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
