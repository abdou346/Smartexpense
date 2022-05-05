import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartexp/homescren.dart';

class logout extends StatefulWidget {
  const logout({Key? key}) : super(key: key);

  @override
  State<logout> createState() => _logoutState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn();

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          child: Text("log out"),
          textColor: Colors.white,
          color: const Color(0xff8234F8),
          height: 50,
          minWidth: 400,
          onPressed: () {
            signOutGoogle();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => homescreen(),
                ));
          }),
    );
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print("User Sign Out");
  }
}
