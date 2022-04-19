import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String phonenumber, double salary,
    double regularexpenses, double solde, int age, String datenaissance) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  users.add({
    'displayName': auth.currentUser!.displayName,
    'uid': uid,
    'phonenumber': phonenumber,
    'email': auth.currentUser!.email,
    'salary': salary,
    'regularexpenses': regularexpenses,
    'soldeactuel': solde,
    'age': age,
    'datenaissance': datenaissance,
  });
  return;
}
