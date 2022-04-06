import 'package:flutter/material.dart';
import 'package:mobil_bilgi_yarismasi/sorular.dart';

class bitis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Sonuç"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Puanınız : " + testim.puan.toString()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/anaSayfa');
                },
                child: Text("Anasayfaya Dön"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
