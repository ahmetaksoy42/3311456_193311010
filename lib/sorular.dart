Yapi testim = new Yapi();

class Yapi {
  int mevcut_soru = 0;
  int puan = 0;

  List<Soru> Sorular = [
    Soru(
        soru: "Kıbrıs Barış harekatı hangi tarihte gerçekleşmiştir?",
        a: "1973",
        b: "1974",
        c: "1970 ",
        d: "1969",
        cevap: "b"),
    Soru(
        soru: "Türk adına ilk defa hangi kaynaklarda rastlanmıştır?",
        a: "Çin",
        b: "Arap",
        c: "Hint",
        d: "Bizans",
        cevap: "a"),
    Soru(
        soru:
            "Aşağıdakilerden hangisi Balkan savaşlarından önce osmanlı egemenliginden çıkan topraklardan biridir?",
        a: "Ege adaları",
        b: "Batı trakya",
        c: "Selanik",
        d: "Rodos ve Oniki Ada",
        cevap: "d"),
    Soru(
        soru: "I.Dünya Savaşı ne  zaman başlamıştır?",
        a: "1915",
        b: "1914",
        c: "1913",
        d: "1920",
        cevap: "b"),
    Soru(
        soru: "Sümer Devleti nerede kurulmuştur?",
        a: "Avrupa",
        b: "Anadolu",
        c: "Orta Asya",
        d: "Mezopotamya",
        cevap: "d"),
    Soru(
        soru: "Malazgirt Meydan Savaşı hangi tarihte olmuştur?",
        a: "1070",
        b: "1071",
        c: "1072",
        d: "1073",
        cevap: "b"),
    Soru(
        soru: "Aya ilk defa kim ayak bastı?",
        a: "Elon Must",
        b: "Yuri Gagarin",
        c: "Neil Armstrong",
        d: "Louis Armstrong",
        cevap: "c"),
    Soru(
        soru: " Cumhuriyetin ilan edildiği tarih nedir?",
        a: "23 Nisan 1920",
        b: "29 Ekim 1923",
        c: "30 Ağustos 1923",
        d: "29 Ekim 1920",
        cevap: "b"),
    Soru(
        soru:
            "İstanbul'u toplam 4 kez kuşatmış olmasına rağmen fethedemeyen padişah hangisidir?",
        a: "II.Murat",
        b: "Yıldırım Beyazıt",
        c: "II.Mehmet",
        d: "Musa Çelebi",
        cevap: "b"),
    Soru(
        soru: "Osmanlı Devleti hangi antlaşma ile fiilen sona ermiştir?",
        a: "Sevr Antlaşması",
        b: "Mondros Ateşkes Antlaşması",
        c: "Lozan Antlaşması",
        d: "İstanbul Antlaşması",
        cevap: "b"),
  ];

  void diger_soruya_gec() {
    if (Sorular.length - 1 > mevcut_soru) {
      mevcut_soru++;
    }
  }

  String soru_metnini_yaz() {
    return Sorular[mevcut_soru].soru_metni;
  }

  String a_sikki_yaz() {
    return Sorular[mevcut_soru].a_sikki;
  }

  String b_sikki_yaz() {
    return Sorular[mevcut_soru].b_sikki;
  }

  String c_sikki_yaz() {
    return Sorular[mevcut_soru].c_sikki;
  }

  String d_sikki_yaz() {
    return Sorular[mevcut_soru].d_sikki;
  }

  void cevap_kontrol(String kullaniciCevabi) {
    if (Sorular[mevcut_soru].Cevap == kullaniciCevabi) {
      puan = puan + 10;
    } else {
      puan = puan - 10;
    }
    print(puan);
    diger_soruya_gec();
  }
}

class Soru {
  String soru_metni = "";
  String a_sikki = "";
  String b_sikki = "";
  String c_sikki = "";
  String d_sikki = "";
  String Cevap = "";

  Soru(
      {required String soru,
      required String a,
      required String b,
      required String c,
      required String d,
      required String cevap}) {
    soru_metni = soru;
    a_sikki = a;
    b_sikki = b;
    c_sikki = c;
    d_sikki = d;
    Cevap = cevap;
  }
}
