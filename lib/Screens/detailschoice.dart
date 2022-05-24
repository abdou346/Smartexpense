import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addexpense.dart';
import 'addrevenue.dart';
import 'package:smartexp/Component/circle.dart';
import 'details.dart';
import 'details2.dart';
import 'lobby.dart';
import 'settings.dart';

class detailschoice extends StatefulWidget {
  const detailschoice({Key? key}) : super(key: key);

  @override
  State<detailschoice> createState() => detailschoiceState();
}

class detailschoiceState extends State<detailschoice> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 0.3;
    int selectedIndex = 0;
    return Scaffold(
      body: Stack(
        children: [
          circle(),
          Container(
            margin: EdgeInsets.only(top: 200, left: 100),
            child: RichText(
              text: TextSpan(
                text: "Add Options  ",
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
            margin: EdgeInsets.only(top: 253),
            height: height,
            width: width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => details2(),
                    ));
              },
              icon: Icon(
                Icons.money,
                size: 24.0,
              ),
              label: Text('See your detailed revenues'),
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
                      builder: (context) => details(),
                    ));
              },
              icon: Icon(
                Icons.money_off,
                size: 24.0,
              ),
              label: Text('See your detailed expenses'),
              style: ElevatedButton.styleFrom(primary: const Color(0xffFF653A)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 730),
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
                  if (selectedIndex == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detailschoice(),
                        ));
                  }
                  if (selectedIndex == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
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
      ),
    );
  }
}
