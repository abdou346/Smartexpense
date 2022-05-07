import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smartexp/lobby.dart';
import 'package:smartexp/theme.dart';

import 'addexpense.dart';
import 'circle.dart';
import 'homescren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      body: Stack(
        children: [
          circle(),
          SettingsList(
            sections: [
              SettingsSection(
                margin: EdgeInsetsDirectional.only(top: 00),
                title: Text(
                  "Settings ",
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: Icon(Icons.login_outlined),
                    title: Text('logout'),
                    onPressed: (context) {
                      signOutGoogle();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => homescreen(),
                      ));
                    },
                  ),
                  SettingsTile(
                    leading: Icon(Icons.format_paint),
                    title: Text('change theme'),
                  ),
                  SettingsTile(
                    leading: Icon(Icons.admin_panel_settings),
                    title: Text('Terms of Service'),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 148, left: 200),
            child: Positioned.fill(
              top: 80,
              child: Align(
                alignment: Alignment.topCenter,
                child: Consumer<ThemeProvider>(
                    builder: (context, provider, child) {
                  return DropdownButton<String>(
                    value: provider.currentTheme,
                    items: [
                      //Light, dark, and system
                      DropdownMenuItem<String>(
                        value: 'light',
                        child: Text(
                          'Light',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),

                      DropdownMenuItem<String>(
                        value: 'dark',
                        child: Text(
                          'Dark',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'system',
                        child: Text(
                          'System',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                    onChanged: (String? value) {
                      provider.changeTheme(value ?? 'system');
                    },
                  );
                }),
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
                  if (selectedIndex == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
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
          ),
        ],
      ),
    );
  }

  void signOutGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    print("User Sign Out");
  }
}
