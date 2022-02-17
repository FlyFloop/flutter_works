import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fireStore =
      FirebaseFirestore.instance; //firebasein bütün metodlarını kullanabilicez

  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef =
        _fireStore.collection('movies'); //moviesin referansını tutuyor
    DocumentReference babaRef =
        moviesRef.doc('Baba'); //baba dökümasyonun referansını aldık
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Firestore CRUD Works'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${babaRef.parent}',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // var response = await babaRef.get();
                    var response_g = await moviesRef.get();
                    //documentsnapshot nedir?
                    //--> veri önce map haline geliyor sonra documentsnapshot adlı bir zarfa koyuyor sonra zarfı bize gönderiyor
                    //  var map = await response.data();
                    var map_g = await response_g.docs;
                    //print(map); //-->{name: Baba, year: 1972, rating: 9.1}
                    print(map_g[0]
                        .data()); //-->{name: Baba, year: 1972, rating: 9.1}
                  },
                  child: Text('get data')),
              StreamBuilder<DocumentSnapshot>(
                stream: babaRef.snapshots(), //neyi dinlediğimiz bilgisi
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> asyncSnapshot) {
                  return Text(
                      '${asyncSnapshot.data?.data()}'); //2kez çıkarma işlemi yapılcak
                }, //her yeri ver geldiğinde builder metodunu çalıştır
              ),
            ],
          ),
        ),
      ),
    );
  }
}
