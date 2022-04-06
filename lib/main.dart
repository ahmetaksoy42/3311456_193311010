import 'package:flutter/material.dart';
import 'package:mobil_bilgi_yarismasi/anaSayfa.dart';
import 'package:mobil_bilgi_yarismasi/bitis.dart';
import 'package:mobil_bilgi_yarismasi/giris.dart';
import 'package:mobil_bilgi_yarismasi/hakkinda.dart';
import 'package:mobil_bilgi_yarismasi/tarihSorulari.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/", routes: {
      '/': (context) => giris(),
      "/hakkinda": (context) => hakkinda(),
      "/anaSayfa": (context) => anaSayfa(
            ad: '',
          ),
      "/tarihSorulari": (context) => tarihSorulari(),
      "/bitis": (context) => bitis(),
    });
  }
}
