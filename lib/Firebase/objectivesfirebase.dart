import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userobjectives(
    String name, double Amount, double monthlygoal) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  var customData = {'name': name, 'Amount': Amount, 'monthlygoal': monthlygoal};
  await FirebaseFirestore.instance
      .collection('Objectives')
      .doc(auth.currentUser!.uid)
      .collection("objectives")
      .add(customData);

  return;
}
