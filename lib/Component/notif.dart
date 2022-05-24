import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('Channel ID', 'Channel Name');
  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }
  Future<void> show() async {
    await flutterLocalNotificationsPlugin.show(
      12345,
      "Smartexp",
      "did you spend any money today ? don't forget to note your expenses ",
      platformChannelSpecifics,
    );
  }
}
