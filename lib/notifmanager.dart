import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    FirebaseMessaging.onMessage.listen((event) {
      // fetchRideInfo(getRideID(message), context);
      (Map<String, dynamic> message) async => print("onMessage: $message");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // fetchRideInfo(getRideID(message), context);
      (Map<String, dynamic> message) async => print("onLaunch: $message");
    });
  }
}
