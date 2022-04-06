import 'package:flutter/material.dart';
import 'package:mobil_bilgi_yarismasi/sorular.dart';

class tarihSorulari extends StatefulWidget {
  @override
  _tarihSorulariState createState() => _tarihSorulariState();
}

class _tarihSorulariState extends State<tarihSorulari> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("TARİH SORULARI"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  testim.soru_metnini_yaz(),
                  style: TextStyle(fontSize: 35),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        testim.cevap_kontrol("a");
                      });
                    },
                    child: Text(
                      testim.a_sikki_yaz(),
                      style: TextStyle(fontSize: 35),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        testim.cevap_kontrol("b");
                      });
                    },
                    child: Text(
                      testim.b_sikki_yaz(),
                      style: TextStyle(fontSize: 35),
                    )),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      testim.cevap_kontrol("c");
                    });
                  },
                  child: Text(
                    testim.c_sikki_yaz(),
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        testim.cevap_kontrol("d");
                      });
                    },
                    child: Text(
                      testim.d_sikki_yaz(),
                      style: TextStyle(fontSize: 35),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bitis');
                  },
                  child: Text(
                    "Bitir",
                    style: TextStyle(fontSize: 40, color: Colors.red),
                  ),
                ),
                /*Text(
                  "Puanınız",
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  testim.puan.toString(),
                  style: TextStyle(fontSize: 35),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
