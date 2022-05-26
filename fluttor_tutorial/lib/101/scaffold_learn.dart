import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Samples'),
      ),
      body: const Center(child: Text('merhaba')),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //floatactionbutton konumunu ayarlar
      drawer: const Drawer(), //sağdan ekran açıyor
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
