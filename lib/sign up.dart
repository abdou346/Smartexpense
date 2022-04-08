import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/homescreen.dart';
import 'package:smartexp/loginscreen.dart';
import 'circle.dart';

final _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController numbercontroller = new TextEditingController();
    final TextEditingController passwordController =
        new TextEditingController();
    final TextEditingController fullnamecontroller =
        new TextEditingController();

    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
          margin: EdgeInsets.only(top: 200, left: 20),
          child: Text(
            "Sign up ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 60, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300, left: 0),
          child: TextFormField(
            controller: fullnamecontroller,
            decoration: InputDecoration(
              labelText: "Full name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 400, left: 0),
          child: TextFormField(
            controller: numbercontroller,
            decoration: InputDecoration(
              labelText: "phone number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 500, left: 0),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 600, left: 0),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 700,
          ),
          child: FlatButton(
              child: Text("Submit"),
              textColor: Colors.white,
              color: const Color(0xff8234F8),
              height: 50,
              minWidth: 400,
              onPressed: () {
                Register(emailController.text, passwordController.text);
              }),
        ),
        /*InkWell(
          child: Container(
            margin: EdgeInsets.only(top: 700, left: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Submit",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff8234F8),
            ),
            height: 50,
            width: 400,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => homescreen(),
                ));
          },
        ),*/
        Container(
          margin: EdgeInsets.only(top: 800, left: 100),
          child: RichText(
            text: TextSpan(
              text: "Already registered ? Log in",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginscreen(),
                      ));
                },
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

void Register(String email, String password) async => await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "Registred Sucessfuly"),
            })
        .catchError((e) {
      print(e);
    });
