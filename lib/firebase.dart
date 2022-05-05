import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartexp/loginscreen.dart';
import 'package:smartexp/sign%20up.dart';

Future<void> userSetup(String name, String phonenumber, double salary,
    double regularexpenses, double solde, String datenaissance) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  double a = 0;
  String uid = auth.currentUser!.uid.toString();
  DocumentReference users =
      FirebaseFirestore.instance.collection('Users').doc(uid);
  final userid = users.set({
    'displayName': name,
    'uid': uid,
    'phonenumber': phonenumber,
    'email': auth.currentUser!.email,
    'salary': salary,
    'regularexpenses': regularexpenses,
    'soldeactuel': solde,
    'datenaissance': datenaissance,
    'expenses': a,
  });
  return;
}

Future<void> userSetupgoogle(String phonenumber, double salary,
    double regularexpenses, double solde, String datenaissance) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  double a = 0;
  DocumentReference users =
      FirebaseFirestore.instance.collection('Users').doc(uid);
  users.set({
    'displayName': auth.currentUser!.displayName,
    'uid': uid,
    'phonenumber': phonenumber,
    'email': auth.currentUser!.email,
    'salary': salary,
    'regularexpenses': regularexpenses,
    'soldeactuel': solde,
    'datenaissance': datenaissance,
    'expenses': a,
  });
  return;
}
