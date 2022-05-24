import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Component/circle.dart';
import 'package:smartexp/Models/usermodel.dart';

class objectives extends StatefulWidget {
  const objectives({Key? key}) : super(key: key);

  @override
  State<objectives> createState() => _objectivesState();
}

usermodel? a;

class _objectivesState extends State<objectives> {
  usermodel? a;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          circle(),
          Container(
            margin: EdgeInsets.only(top: 50, left: 90),
            child: RichText(
              text: TextSpan(
                text: "   Your Goals   ",
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 160,
              ),
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: RichText(
                  text: TextSpan(
                    text: " You've already saved : \n ${a?.Savings} ",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Users')
        .doc('${auth.currentUser?.uid}')
        .get()
        .then((value) {
      this.a = usermodel.fromMap(value.data());

      setState(() {});
    });
  }
}
