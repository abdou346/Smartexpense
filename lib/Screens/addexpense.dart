import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Screens/lobby.dart';
import 'package:smartexp/Screens/settings.dart';

import 'package:smartexp/Firebase/expfirebase.dart';

import '../Component/circle.dart';
import 'Add.dart';
import 'detailschoice.dart';
import 'objectives.dart';

class addexpenses extends StatefulWidget {
  const addexpenses({Key? key}) : super(key: key);

  @override
  State<addexpenses> createState() => _addexpensesState();
}

class _addexpensesState extends State<addexpenses> {
  @override
  final name = TextEditingController();
  final amount = TextEditingController();
  final type = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    int selectedIndex = 2;
    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
          margin: EdgeInsets.only(top: 200, left: 20),
          child: Text(
            "Add expense ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300, left: 0),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelText: "name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 400, left: 0),
          child: TextFormField(
            controller: amount,
            decoration: InputDecoration(
              labelText: "amount",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 500, left: 0),
          child: TextFormField(
            controller: type,
            decoration: InputDecoration(
              labelText: "payment Type",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: width,
          margin: EdgeInsets.only(top: 600, left: 20),
          child: ElevatedButton(
              child: Text("ADD"),
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
                usererexp(name.text, double.parse(amount.text), type.text);
                rankdokter(double.parse(amount.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lobby(),
                    ));
              }),
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
                  ),
                  label: 'add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
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
    ));
  }

  Future<void> rankdokter(double i) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datadokter = firestore.collection('Users');
    await datadokter.doc(auth.currentUser!.uid).update(
      {
        'soldeactuel': FieldValue.increment(-i),
        'expenses': FieldValue.increment(i)
      },
    );
  }
}
