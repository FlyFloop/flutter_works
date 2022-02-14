//stream --> async*

import 'dart:async';

void main(List<String> args) {
  /*
  myStreamFunction().listen((event) {
    //event --> stream fonksiyonun programa yolladığı veri

    print(event); //yayınlanan veriyi yazdırdık
  });
 */

//Streamicontroller oluşturuyoruz
  StreamController _streamController = StreamController();

//streamin başından itibaren veri doldurmaya başlıyoruz
  void functionForStreamController() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      _streamController.sink.add(i + 1);
    }
  }

  functionForStreamController();
  //ardından doldurduğumuz streami dinliyoruz
  _streamController.stream.listen((event) {
    print(event);
  });
}

Stream<int> myStreamFunction() async* {
  for (var i = 0; i < 10; i++) {
    //1 saniye bekleyip bize veriyi gödersin
    await Future.delayed(Duration(seconds: 1));
    yield i + 1; //dinleyen fonksiyona yayınlıyor
  }
}
