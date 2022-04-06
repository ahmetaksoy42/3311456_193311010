import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_bilgi_yarismasi/anaSayfa.dart';

class giris extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  //const giris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilgi Yarışmasına Hoşgeldiniz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Adınızı Giriniz',
                ),
                controller: t1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => anaSayfa(
                                ad: t1.text,
                              )));
                },
                child: const Text('Giriş'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
