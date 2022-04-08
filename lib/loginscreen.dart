import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smartexp/homescreen.dart';
import 'package:smartexp/sign%20up.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'circle.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

final _auth = FirebaseAuth.instance;

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController =
        new TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            circle(),
            Container(
                height: 400,
                width: 400,
                margin: EdgeInsets.only(top: 105, left: 20),
                child: Image.asset(
                  "img/logo.png",
                  fit: BoxFit.contain,
                )),
            Container(
              margin: EdgeInsets.only(top: 400, left: 0),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 475, left: 0),
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
            /* Container(
              margin: EdgeInsets.only(top: 400, left: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Username, Email',
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 475, left: 0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            */
            Container(
              margin: EdgeInsets.only(top: 550, left: 250),
              child: RichText(
                text: TextSpan(
                  text: "Forgot your password?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('The button is clicked!');
                    },
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            /*InkWell(
              child: Container(
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign in",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal)),
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
                signIn(emailController.text, passwordController.text);
              },
            ),*/
            Container(
              margin: EdgeInsets.only(
                top: 600,
              ),
              child: FlatButton(
                  child: Text("Submit"),
                  textColor: Colors.white,
                  color: const Color(0xff8234F8),
                  height: 50,
                  minWidth: 400,
                  onPressed: () {
                    signIn(emailController.text, passwordController.text);
                  }),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 670, left: 100),
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 800, left: 75),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account ? Register",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Signup())));
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
            /*Container(
              margin: EdgeInsets.only(top: 759, left: 150),
              child: Image.asset(
                "img/google.png",
                
                fit: BoxFit.contain,
              ),
              
            ),*/
          ],
        ));
  }
}

void signIn(String email, String password) async {
  await _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
            Fluttertoast.showToast(msg: "Login Sucessful"),
          })
      .catchError((e) {
    print(e);
  });
}
