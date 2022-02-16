void birFonksiyon(int numara) {
  if (numara <= 100) {
    print(numara);
  } else if (numara >= 100 && numara <= 1000) {
    throw ExceptionTypeB();
  } else {
    throw ExceptionTypeA();
  }
}

void main(List<String> args) {
  try {
    birFonksiyon(132);
  } on ExceptionTypeA {
    print('a tipi bir hata yakalandı');
  } finally {
    print('finally her zaman çalışır');
  }
}

class ExceptionTypeA implements Exception {}

class ExceptionTypeB implements Exception {}
