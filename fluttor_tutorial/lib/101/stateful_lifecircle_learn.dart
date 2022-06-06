import 'package:flutter/material.dart';

class LifeCycleLearn extends StatefulWidget {
  LifeCycleLearn({Key? key, required this.message}) : super(key: key);
  String message;

  @override
  State<LifeCycleLearn> createState() => _LifeCycleLearnState();
}

class _LifeCycleLearnState extends State<LifeCycleLearn> {
  final textEven = 'Kelime Tek';
  final textOdd = 'Kelime Çift';
  String _message = '';
  late final bool _isOdd;
  @override
  void didChangeDependencies() {
    /* 
    init stateden sonraçalışır sayfanın içerisinde widgetlarda
    bir state değişimi olduğunda tekrardan çağrılıyor
     */
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant LifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('b');
  }
  @override
  void dispose() {
    /**
     sayfa kapandıktan sonra burası çağrılır
     */
    super.dispose();
  }

  @override
  void initState() {
    /* 
    initstate bittikten sonra build çalışıyor
    classların constructor gibidir önce burası çalışır sonra sayfa çizilir
    */
    super.initState();
    _isOdd = widget.message.length.isOdd;
    _message = widget.message;
    _computeOdd();
    print('a');
  }

  void _computeOdd() {
    if (_isOdd) {
      _message = 'Tektir';
    } else {
      _message = 'Çifttir';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isOdd ? textEven : textOdd),
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
