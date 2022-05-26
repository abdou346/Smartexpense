import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Firebase/objectivesfirebase.dart';
import 'package:smartexp/Screens/objectives.dart';
import 'Add.dart';
import 'detailschoice.dart';
import 'package:smartexp/Firebase/expfirebase.dart';
import 'lobby.dart';
import 'settings.dart';

import '../Component/circle.dart';

class addobjective extends StatefulWidget {
  const addobjective({Key? key}) : super(key: key);

  @override
  State<addobjective> createState() => _addobjectiveState();
}

class _addobjectiveState extends State<addobjective> {
  double _currentSliderValue = 20;

  @override
  final name = TextEditingController();
  final amount = TextEditingController();
  final type = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    int selectedIndex = 3;
    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
          margin: EdgeInsets.only(top: 50, left: 60),
          child: Text(
            "Add a saving goal ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 190, left: 20),
          child: Text(
            "Amount : \n ${_currentSliderValue} ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300),
          height: 40,
          padding: EdgeInsets.all(8.0),
          child: Slider(
            activeColor: const Color(0xff8234F8),
            value: _currentSliderValue,
            max: 300000,
            divisions: 20,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 400, left: 0),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelText: "What do you want to save for ?",
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
              labelText: "savings per month",
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
                userobjectives(
                    name.text, _currentSliderValue, double.parse(type.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => objectives(),
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
    ));
  }

  Future<void> addrevevenue(double i) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datadokter = firestore.collection('Users');
    await datadokter.doc(auth.currentUser!.uid).update(
      {
        'soldeactuel': FieldValue.increment(i),
      },
    );
  }
}
