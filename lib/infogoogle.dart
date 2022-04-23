import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/logout.dart';

import 'circle.dart';
import 'loginscreen.dart';
import 'firebase.dart';
import 'sign up.dart';

class infogoogle extends StatefulWidget {
  const infogoogle({Key? key}) : super(key: key);

  @override
  State<infogoogle> createState() => _infoState();
}

final Salarycontroller = TextEditingController();
final expcontroller = TextEditingController();
final soldecontroller = TextEditingController();
final agecontroller = TextEditingController();
final datenaissancecontroller = TextEditingController();

class _infoState extends State<infogoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
          margin: EdgeInsets.only(top: 100, left: 20),
          child: Text(
            "More about you ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 550, left: 0),
          child: TextFormField(
            controller: Salarycontroller,
            decoration: InputDecoration(
              labelText: "salary",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 640, left: 0),
          child: TextFormField(
            controller: expcontroller,
            decoration: InputDecoration(
              labelText: "regular monthly expenses",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 450, left: 0),
          child: TextFormField(
            controller: soldecontroller,
            decoration: InputDecoration(
              labelText: "Solde actuel",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 250, left: 0),
          child: TextFormField(
            controller: agecontroller,
            decoration: InputDecoration(
              labelText: "phone number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 350, left: 0),
          child: TextFormField(
            controller: datenaissancecontroller,
            decoration: InputDecoration(
              labelText: "Date de naissance (dd/mm/yy)",
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
                userSetupgoogle(
                    agecontroller.text,
                    double.parse(Salarycontroller.text),
                    double.parse(expcontroller.text),
                    double.parse(soldecontroller.text),
                    datenaissancecontroller.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => logout(),
                    ));
              }),
        ),
      ],
    ));
  }
}
