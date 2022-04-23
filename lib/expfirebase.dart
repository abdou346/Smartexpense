import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartexp/loginscreen.dart';
import 'package:smartexp/sign%20up.dart';

Future<void> usererexp(String name, double Amount, String type) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  var customData = {'name': name, 'Amount': Amount, 'type': type};
  await FirebaseFirestore.instance
      .collection('Expenses')
      .doc(auth.currentUser!.uid)
      .collection("expenses")
      .add(customData);

  return;
}
