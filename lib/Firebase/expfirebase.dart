import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future<void> userreven(String name, double Amount, String type) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  var customData = {'name': name, 'Amount': Amount, 'type': type};
  await FirebaseFirestore.instance
      .collection('Revenues')
      .doc(auth.currentUser!.uid)
      .collection("revenues")
      .add(customData);

  return;
}
