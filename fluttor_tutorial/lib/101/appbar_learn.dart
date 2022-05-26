import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarLearn extends StatelessWidget {
  const AppbarLearn({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0, //transparentten sonra üstteki boşluğu gidermek için,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: false, //back butonunu atmasını engelliyoruz
        actions: [
          //appbarın sağ tarafı kullanmamıza izin verir
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
