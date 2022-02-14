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
      //bir hata oluşturalım
      if (i == 6) _streamController.addError('bir hata oluştu'); //hata ekledik
      _streamController.sink.add(i + 1);
    }
    _streamController.addError('bir hata oluştu'); //hata ekledik
    _streamController
        .close(); //streami kapattık ve yayın yapan herkes kapandığını söylüyor
  }

  functionForStreamController();
  //ardından doldurduğumuz streami dinliyoruz
  _streamController.stream.listen((event) {
    print(event);
  },
      //stream dinlemesi bitince neler yapılacağı onDone'da tanımlanır
      onDone: () {
    print('streamcontroller listen done');
  },
      //listenin işlemi yapılırken hata çıktığında neler yapılacağı enError'da tanımlanır
      onError: (error) {
    print('streamcontroller listen error hata :');
    print(error.toString());
  }, cancelOnError: true //bir hata ile karşılaşıldığında işlemleri durduruyor
      );
}

Stream<int> myStreamFunction() async* {
  for (var i = 0; i < 10; i++) {
    //1 saniye bekleyip bize veriyi gödersin
    await Future.delayed(Duration(seconds: 1));
    yield i + 1; //dinleyen fonksiyona yayınlıyor
  }
}
