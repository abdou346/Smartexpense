import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartexp/Component/circle.dart';
import 'lobby.dart';
import 'loginscreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn();

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
                height: height,
                width: 400,
                margin: EdgeInsets.only(top: 175, left: 20),
                child: Image.asset(
                  "img/hh.png",
                  fit: BoxFit.contain,
                )),
            circle(),
          ]),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "Explore the app",
              style: GoogleFonts.outfit(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Text(
                "Welcome to SMART EXPENSE, this app will allow you to manage your money, keeping a daily record of your expenses by tracking it improves the financial health of your budget, thus the purpose of our application.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 500,
            margin: EdgeInsets.only(top: 00, left: 0),
            child: ElevatedButton(
                child: Text("Start app"),
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
                  signOutGoogle();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginscreen(),
                      ));
                }),
          ),
        ]),
      ),
    );
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print("User Sign Out");
  }
}
