import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/expfirebase.dart';
import 'package:smartexp/lobby.dart';

import 'circle.dart';

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
  Widget build(BuildContext context) {
    int selectedIndex = 0;
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
          margin: EdgeInsets.only(top: 600, left: 30),
          child: FlatButton(
              child: Text("ADD"),
              textColor: Colors.white,
              color: const Color(0xff8234F8),
              height: 50,
              minWidth: 300,
              onPressed: () {
                usererexp(name.text, double.parse(amount.text), type.text);
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 727),
          child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
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
                ;
                if (selectedIndex == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => addexpenses(),
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
                    Icons.pie_chart,
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
        )
      ],
    ));
  }
}
