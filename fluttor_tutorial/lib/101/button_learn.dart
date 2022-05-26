import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  //butona basıldığında yeşil basılma bittikten sonra beyaz yapar
                  if (states.contains(MaterialState.pressed)) {
                    //state contains ile anlık durumu aldık
                    return Colors.green;
                  }
                  return Colors.white;
                })),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.subtitle2,
                )), //yazı buton text button
            // ignore: prefer_const_constructors
            ElevatedButton(
                onPressed:
                    null, //eğer onpresseda null atanırsa buton disabled olur
                child: Text('data')), //normal buton
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.save)), //icon buton
            FloatingActionButton(
              onPressed: () {
                //servise istek at
                //sayfanın rengini düzenle
                //userın ekrana butona basıp yapıcağı işlem demektir
              },
              child: Text('put'),
            ), //klasik yuvarlak her uygulamada olan buton
            SizedBox(
              height:
                  100, //butona size vermek istiyorsak sizedbox ile çevreleyip height ve width
              //atarız
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(19),
                      backgroundColor: Colors.black,
                      shape: CircleBorder()),
                  onPressed: () {},
                  child: Text('get')),
            ), //etrafında radiuslu oluşan buton
            InkWell(
              onTap: () {},
              child: Text('custom'),
            ), //sadece child alanına özel action işlemler atıyor daha custom bir buton çeşidir,
            Container(
              height: 200,
              color: Colors.white,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {},
                child: Text('Place bid'))
          ],
        ),
      ),
    );
  }
}

/*
Borders:
CircleBorder, RoundedRectanglBorder
 */
