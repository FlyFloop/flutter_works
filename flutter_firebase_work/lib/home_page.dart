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
  String babaName = '';
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController yearEditingController = TextEditingController();
  TextEditingController ratingEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef =
        _fireStore.collection('movies'); //moviesin referansını tutuyor
    DocumentReference babaRef =
        moviesRef.doc('Baba'); //baba dökümasyonun referansını aldık
    DocumentReference karasovalye =
        moviesRef.doc('Kara Şövalye'); //baba dökümasyonun referansını aldık
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
                    var response = await babaRef.get();
                    // var response_g = await moviesRef.get();
                    //documentsnapshot nedir?
                    //--> veri önce map haline geliyor sonra documentsnapshot adlı bir zarfa koyuyor sonra zarfı bize gönderiyor
                    Map<String, dynamic> map =
                        await response.data() as Map<String, dynamic>;
                    //var map_g = await response_g.docs;
                    print(
                        map['name']); //-->{name: Baba, year: 1972, rating: 9.1}
                    //print(map_g[0]
                    //    .data()); //-->{name: Baba, year: 1972, rating: 9.1}
                    setState(() {
                      babaName = map['name'];
                    });
                    karasovalye.delete();
                    print(babaName);
                  },
                  child: Text('get data')),
              Text('$babaName'),
              StreamBuilder<DocumentSnapshot>(
                stream: babaRef.snapshots(), //neyi dinlediğimiz bilgisi

                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text('bir hata oluştu tekrar deneyiniz'),
                    );
                  } else {
                    if (asyncSnapshot.hasData) {
                      return Text(
                          '${asyncSnapshot.data?.data()}'); //2kez çıkarma işlemi yapılcak
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                }, //her yeri ver geldiğinde builder metodunu çalıştır
              ),
              TextFormField(
                controller: nameEditingController,
                decoration: InputDecoration(
                    hintText: 'Film adını giriniz',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: yearEditingController,
                decoration: InputDecoration(
                    hintText: 'Filmin yılını giriniz',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ratingEditingController,
                decoration: InputDecoration(
                    hintText: 'Rating Giriniz',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(nameEditingController.text);
          print(ratingEditingController.text);
          print(yearEditingController.text);

          //text alanlarındaki veriden bir map oluşturulması
          Map<String, dynamic> movieData = {
            'name': nameEditingController.text,
            'rating': ratingEditingController.text,
            'year': yearEditingController.text
          };
          //veriyi yazmak istediğimiz referansa ulaşacağız ve ilgili metodu çağıracağız
          await moviesRef.doc(nameEditingController.text).set(movieData);
          //döküman referansı oluşturduk ve ardından set ile ekledik

          //referans yoluyla veriyi güncellemiş olduk
          await moviesRef.doc('Başlangıç').update({'rating': 10});
        },
        child: Text('Ekle'),
      ),
    );
  }
}
