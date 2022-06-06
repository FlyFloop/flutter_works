import 'package:flutter/material.dart';

class TextfieldLearn extends StatefulWidget {
  const TextfieldLearn({Key? key}) : super(key: key);

  @override
  State<TextfieldLearn> createState() => _TextfieldLearnState();
}

class _TextfieldLearnState extends State<TextfieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        maxLength: 20,
        keyboardType: TextInputType.emailAddress,//klavyeyi email tipinde açıyor
        autofillHints: [AutofillHints.email], //otomatik olarak doldurma seçeneklerini getiyiro
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          
          border: OutlineInputBorder(),
          labelText: 'mail',
        ),
      ),
    );
  }
}
