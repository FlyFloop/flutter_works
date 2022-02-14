void main(List<String> arguments) {
  List ilk5 = [1, 2, 3, 4, 5];
  List alfabe = ['a', 'a', 'a', 'b', 'c', 'd', 'e', 'f'];
  List nota = ['do', 're', 'mi', 'fa', 'sol', 'la', 'si'];
  List saymaSayilar = [
    'bir',
    'iki',
    'üç',
    'dört',
    'beş',
    'altı',
    'yedi',
    'sekiz'
  ];
  List karisik = ['a', 'b', 1, 3, 5, 'do', 're', 'mi', 1.2, 1.3];
  List hafta = [
    'pazartesi',
    'salı',
    'çarşamba',
    'perşembe',
    'cuma',
    'cumartesi',
    'pazar'
  ];
  print(ilk5.any((element) {
    //sıra sıra bütün elemanları alıp sorguya koyuyor
    return element > 5; //listede 5'ten büyük eleman var mı
  }));
  print(alfabe.indexOf('f'));
}
