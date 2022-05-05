import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartexp/expensesmodel.dart';
import 'package:smartexp/usermodel.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  usermodel? a = usermodel();
  expensesmodel? b = expensesmodel();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 700,
      ),
      child: FlatButton(
          child: Text("Submit"),
          textColor: Colors.white,
          color: const Color(0xff8234F8),
          height: 50,
          minWidth: 400,
          onPressed: () {
            print("             Expenses \n \n            ${b?.Amount}");
          }),
    );
  }

  void initState() {
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
  }
}
