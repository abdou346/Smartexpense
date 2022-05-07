import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartexp/circle.dart';
import 'package:smartexp/lobby.dart';
import 'package:smartexp/loginscreen.dart';

import 'circle.dart';

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
                "Debutez votre aventure , cette applicaion fera partie de votre quotidien et vous aidera a mieux gerer votre budget.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ),
            ),
          ),
          SingleChildScrollView(
            child: InkWell(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Start app",
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
                signOutGoogle();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginscreen(),
                    ));
              },
            ),
          )
        ]),
      ),
    );
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print("User Sign Out");
  }
}
