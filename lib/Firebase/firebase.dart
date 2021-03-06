import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    String name,
    String phonenumber,
    double salary,
    double regularexpenses,
    double solde,
    String datenaissance,
    String? Devise) async {
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
    'Devise': Devise,
    'Savings': a,
    'monthlyexpense': a,
  });
  return;
}

Future<void> userSetupgoogle(
    String phonenumber,
    double salary,
    double regularexpenses,
    double solde,
    String datenaissance,
    String? Devise) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  double a = 0;
  bool t = false;
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
    'updated': t,
    'Devise': Devise,
    'Savings': a,
    'monthlyexpense': a,
  });
  return;
}
