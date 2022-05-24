import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smartexp/Component/circle.dart';
import 'addexpense.dart';
import 'homescren.dart';
import 'info.dart';
import 'lobby.dart';
import 'sign%20up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'sign up.dart';
import 'infogoogle.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final TextEditingController emailcontroller = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();
String? email;
String? name;
String? uid;

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
            height: height,
            width: 410,
            margin: EdgeInsets.only(top: 115, left: 10),
            child: Image.asset(
              "img/logo.png",
              fit: BoxFit.contain,
            )),
        Container(
          margin: EdgeInsets.only(top: 400, left: 0),
          child: TextFormField(
              controller: emailcontroller,
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
        Container(
          margin: EdgeInsets.only(top: 550, left: 250),
          child: RichText(
            text: TextSpan(
              text: "Forgot your password?",
              recognizer: TapGestureRecognizer()..onTap = () {},
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
        Container(
          margin: EdgeInsets.only(
            top: 600,
          ),
          child: FlatButton(
              child: Text("Sign in"),
              textColor: Colors.white,
              color: const Color(0xff8234F8),
              height: 50,
              minWidth: 400,
              onPressed: () {
                signIn(emailcontroller.text, passwordController.text);
              }),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(top: 670, left: 100),
          child: SignInButton(
            Buttons.Google,
            onPressed: () {
              signInWithGoogle();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 730, left: 75),
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
      ],
    ));
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    ///  Get the email from selected google account
    var email = googleUser!.email;

    ///  Check the existence
    var methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    if (methods.contains('google.com')) {
      ///  User already signed-up with this google account
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => lobby(),
          ));
    } else {
      ///  User is trying to sign-up for first time
      ///
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => infogoogle(),
          ));
    }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
