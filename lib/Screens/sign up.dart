import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Component/circle.dart';
import 'homescren.dart';
import 'info.dart';
import 'loginscreen.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

final _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final fullNameController = TextEditingController();
final emailController = TextEditingController();
final numbercontroller = TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    String _password = '';

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
            controller: fullNameController,
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
          margin: EdgeInsets.only(top: 600),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (value.trim().length < 8) {
                return 'Password must be at least 8 characters in length';
              }
              // Return null if the entered password is valid
              return 'lolol';
            },
            onChanged: (value) => _password = value,
          ),
        ),
        Container(
          height: 50,
          width: 500,
          margin: EdgeInsets.only(top: 700, left: 0),
          child: ElevatedButton(
              child: Text("Submit"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff8234F8),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: const Color(0xff8234F8),
                          )))),
              onPressed: () {
                Register((emailController.text).trim(), _password);
              }),
        ),
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

  void Register(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "Registred Sucessfuly"),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => info(),
                  ))
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
