import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Screens/addexpense.dart';
import 'package:smartexp/Screens/addrevenue.dart';
import 'package:smartexp/Screens/detailschoice.dart';
import 'package:smartexp/Screens/lobby.dart';
import 'package:smartexp/Screens/settings.dart';

import 'package:smartexp/Component/circle.dart';

import 'objectives.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 0.3;
    int selectedIndex = 2;
    return Scaffold(
      body: Stack(
        children: [
          circle(),
          Container(
            margin: EdgeInsets.only(top: 50, left: 90),
            child: RichText(
              text: TextSpan(
                text: " Transactions  ",
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
            margin: EdgeInsets.only(top: 253),
            height: height,
            width: width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => addrevenue(),
                    ));
              },
              icon: Icon(
                Icons.money,
                size: 24.0,
              ),
              label: Text('Add a Revenue'),
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
                      builder: (context) => addexpenses(),
                    ));
              },
              icon: Icon(
                Icons.money_off,
                size: 24.0,
              ),
              label: Text('Add an expense'),
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
      ),
    );
  }
}
