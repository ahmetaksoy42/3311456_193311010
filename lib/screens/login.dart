import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

String email = "";

class _FormScreenState extends State<FormScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordToggle = true;

  /*
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
      */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Hoşgeldiniz"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formField,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/loginAvatar.png",
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value!.isEmpty) {
                        return "Mail Adresinizi Girin.";
                      } else if (!emailValid) {
                        return "Geçerli Bir Mail Adresi Girin.";
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscuringCharacter: "*",
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: passwordToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passwordToggle = !passwordToggle;
                          });
                        },
                        child: Icon(passwordToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
                        //şifre gizli başlıyor
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Şifrenizi Girin";
                      } else if (passwordController.text.length < 8) {
                        return "Şifreniz 8 Karakterden Küçük Olamaz";
                      }
                    },
                  ),
                  SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      if (_formField.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                        print("Giriş Yapıldı");
                        emailController.clear();
                        passwordController.clear();
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Giriş Yapın",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kayıtlı hesabınız yok mu?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Kaydolun",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
