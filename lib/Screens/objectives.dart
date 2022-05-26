import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Component/circle.dart';
import 'package:smartexp/Models/usermodel.dart';
import 'package:smartexp/Screens/addobjectives.dart';
import 'package:smartexp/Screens/lobby.dart';
import 'package:smartexp/Screens/objectivedetails.dart';

import 'Add.dart';
import 'Settings.dart';
import 'detailschoice.dart';

class objectives extends StatefulWidget {
  const objectives({Key? key}) : super(key: key);

  @override
  State<objectives> createState() => _objectivesState();
}

usermodel? a;
var growableListid = [];
var growableListam = [];
var growableListty = [];
var growableListna = [];

class _objectivesState extends State<objectives> {
  usermodel? a;
  int selectedIndex = 3;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 0.3;
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
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 200,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        " You've already saved :  ${a?.Savings} ${a?.Devise}  ",
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 253),
            height: height,
            width: width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => objectivedetails(),
                    ));
              },
              icon: Icon(
                Icons.airplane_ticket,
                size: 24.0,
              ),
              label: Text('See your goals'),
              style: ElevatedButton.styleFrom(primary: const Color(0xff8234F8)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 490),
            height: height,
            width: width,
            child: ElevatedButton.icon(
              // <-- ElevatedButton
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => addobjective(),
                    ));
              },
              icon: Icon(
                Icons.work,
                size: 24.0,
              ),
              label: Text('add an objective'),
              style: ElevatedButton.styleFrom(primary: const Color(0xffFF653A)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 730),
            child: BottomNavigationBar(
                selectedIconTheme:
                    IconThemeData(color: const Color(0xffFF653A)),
                selectedItemColor: const Color(0xffFF653A),
                currentIndex: selectedIndex,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  if (selectedIndex == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => lobby(),
                        ));
                  }
                  if (selectedIndex == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detailschoice(),
                        ));
                  }
                  ;
                  if (selectedIndex == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => add(),
                        ));
                  }
                  ;
                  if (selectedIndex == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                  if (selectedIndex == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => objectives(),
                        ));
                  }
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.grey,
                      ),
                      label: 'card'),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    label: 'add',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: 'pie chart',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      label: 'settings'),
                ]),
          ),
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

    FirebaseFirestore.instance
        .collection('Objectives')
        .doc('${auth.currentUser!.uid}')
        .collection('objectives')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // getdocid(doc.id, doc['Amount'], doc['type'], doc['name']);
        growableListid.add(doc.id);
        growableListam.add(doc['Amount'].toString());
        growableListty.add(doc['monthlygoal'].toString());
        growableListna.add(doc['name']);
      });
      setState(() {});
    });
  }
}
