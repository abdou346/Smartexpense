import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Component/circle.dart';
import 'Add.dart';
import 'addexpense.dart';
import 'details.dart';
import 'detailschoice.dart';
import 'package:smartexp/Models/expensesmodel.dart';
import 'homescren.dart';
import 'objectives.dart';
import 'settings.dart';
import 'package:smartexp/Models/usermodel.dart';
import 'package:table_calendar/table_calendar.dart';

class lobby extends StatefulWidget {
  const lobby({Key? key}) : super(key: key);

  @override
  State<lobby> createState() => _lobbyState();
}

class _lobbyState extends State<lobby> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var growableList = [];
  DateTime now = DateTime.now();

  int i = 0;
  int j = 0;

  usermodel? a;
  expensesmodel? b;
  expensesmodel? c;
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
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
              text:
                  "        Total Balance  \n\n        ${a?.soldeactuel} ${a?.Devise}",
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
              text:
                  "             Expenses \n \n           ${a?.expenses} ${a?.Devise}",
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
              DataCell(
                  Text((growableList.length > 0 ? "${growableList[3]}" : ''))),
              DataCell(Text((growableList.length > 0
                  ? "${growableList[1]} ${a?.Devise}"
                  : '')))
            ]),
            DataRow(cells: [
              DataCell(
                  Text((growableList.length > 0 ? "${growableList[7]}" : ''))),
              DataCell(Text((growableList.length > 0
                  ? "${growableList[5]} ${a?.Devise}"
                  : '')))
            ]),
            DataRow(cells: [
              DataCell(
                  Text((growableList.length > 0 ? "${growableList[11]}" : ''))),
              DataCell(Text((growableList.length > 0
                  ? "${growableList[9]} ${a?.Devise}"
                  : '')))
            ]),
          ]),
        ),
      ]),
    ));
  }

  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Users')
        .doc('${auth.currentUser?.uid}')
        .get()
        .then((value) {
      this.a = usermodel.fromMap(value.data());
      if (now.day != 1) {
        updateNotifications(true);
      }

      if (now.day == 1 && a?.updated == true) {
        rankdokter(a?.salary, a?.regularexpenses);
        rankdokterr(a?.regularexpenses);
        updateNotifications(false);
      }
      setState(() {});
    });

    FirebaseFirestore.instance
        .collection('Expenses')
        .doc('${auth.currentUser!.uid}')
        .collection('expenses')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // getdocid(doc.id, doc['Amount'], doc['type'], doc['name']);
        growableList.add(doc.id);
        growableList.add(doc['Amount'].toString());
        growableList.add(doc['type']);
        growableList.add(doc['name']);
      });
      setState(() {});
    });
  }

  Future<void> updateNotifications(bool a) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .update({
      'updated': a,
    });
  }

  Future<void> rankdokter(double? i, double? j) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datadokter = firestore.collection('Users');
    await datadokter.doc(auth.currentUser!.uid).update(
      {
        'soldeactuel': FieldValue.increment(i!),
        'expenses': FieldValue.increment(j!)
      },
    );
  }

  Future<void> rankdokterr(double? j) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference datadokter = firestore.collection('Users');
    await datadokter.doc(auth.currentUser!.uid).update(
      {
        'soldeactuel': FieldValue.increment(-j!),
      },
    );
  }
  //void getdocid(String id, double a, String b, String c) {

  // }
}
