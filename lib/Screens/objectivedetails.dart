import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Component/circle.dart';
import 'Add.dart';
import 'detailschoice.dart';
import 'lobby.dart';
import 'Settings.dart';
import 'package:smartexp/Models/usermodel.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Models/expensesmodel.dart';
import 'addexpense.dart';
import 'objectives.dart';

class objectivedetails extends StatefulWidget {
  const objectivedetails({Key? key}) : super(key: key);

  @override
  State<objectivedetails> createState() => _objectivedetailsState();
}

class _objectivedetailsState extends State<objectivedetails> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var growableListid = [];
  var growableListam = [];
  var growableListty = [];
  var growableListna = [];

  int i = 0;
  int j = 0;
  usermodel? a;
  expensesmodel? b;
  expensesmodel? c;
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 3;
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
        body: Stack(children: [
      circle(),
      Container(
        margin: EdgeInsets.only(top: 50, left: 90),
        child: RichText(
          text: TextSpan(
            text: "   Objectives ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      ListView.separated(
        padding: EdgeInsets.only(top: 220),
        separatorBuilder: (context, position) {
          return Card(
            color: const Color(0xff8234F8),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                ' ${position + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemBuilder: (context, position) {
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'you are saving for ${growableListna[position]} \n\nAmount: ${growableListam[position]}  \n\n savings per month ${growableListty[position]}',
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
          );
        },
        itemCount: growableListid.length,
      ),
      Container(
        margin: EdgeInsets.only(top: 730),
        child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: const Color(0xffFF653A)),
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
    ]));
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
        growableListam.add(doc['Amount'].toString() + "${a?.Devise}");
        growableListty.add(doc['monthlygoal'].toString() + "${a?.Devise}");
        growableListna.add(doc['name']);
      });
      setState(() {});
    });
  }
}
