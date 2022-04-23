import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/addexpense.dart';
import 'package:smartexp/expensesmodel.dart';
import 'package:smartexp/homescreen.dart';
import 'package:smartexp/usermodel.dart';
import 'package:table_calendar/table_calendar.dart';

import 'circle.dart';

class lobby extends StatefulWidget {
  const lobby({Key? key}) : super(key: key);

  @override
  State<lobby> createState() => _lobbyState();
}

class _lobbyState extends State<lobby> {
  usermodel? a = usermodel();
  expensesmodel? b = expensesmodel();
  expensesmodel? c = expensesmodel();
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: [
            circle(),
            Container(
              margin: EdgeInsets.only(top: 50, left: 120),
              child: RichText(
                text: TextSpan(
                  text: "    Home    ",
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200, left: 0),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFF653A))),
                calendarFormat: CalendarFormat.week,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 350),
              width: width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff8234F8),
              ),
              child: RichText(
                text: TextSpan(
                  text: "        Total Balance  \n\n         14000dh",
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 350, left: 180),
              width: width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffFF653A),
              ),
              child: RichText(
                text: TextSpan(
                  text: "             Expenses \n \n            12000dh",
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 727),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (selectedIndex == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addexpenses(),
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
                    ;
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
            ),
            Container(
              width: 1000,
              margin: EdgeInsets.only(top: 500),
              child: DataTable(columns: [
                DataColumn(label: Text('name')),
                DataColumn(label: Text('Amount')),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text("shoes")),
                  DataCell(Text("1000 dh"))
                ]),
                DataRow(cells: [
                  DataCell(Text("groceries ")),
                  DataCell(Text("1200 dh"))
                ]),
              ]),
            ),
          ]),
        ));
  }

  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('Users')
        .doc('${auth.currentUser!.uid}')
        .get()
        .then((value) {
      a = usermodel.fromMap(value.data());

      setState(() {});
    });
    FirebaseFirestore.instance
        .collection('Expenses')
        .doc('${auth.currentUser!.uid}')
        .collection('expenses')
        .doc('8aFC1LPLz0xQFMNy9KsJ')
        .get()
        .then((value) {
      b = expensesmodel.fromMap(value.data());

      setState(() {});
    });

    FirebaseFirestore.instance
        .collection('Expenses')
        .doc('${auth.currentUser!.uid}')
        .collection('expenses')
        .doc('SAXx7zN8rKw1MHK1VRiG')
        .get()
        .then((value) {
      c = expensesmodel.fromMap(value.data());

      setState(() {});
    });
  }
}
