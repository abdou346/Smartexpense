import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smartexp/homescren.dart';
import 'package:smartexp/lobby.dart';
import 'package:smartexp/modelprovider.dart';
import 'package:smartexp/settings.dart';
import 'package:smartexp/theme.dart';
import 'package:smartexp/usermodel.dart';

import 'notif.dart';
import 'notifmanager.dart';

DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().init();
  await NotificationService().show();
  PushNotificationService().initialise;
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        themeMode: provider.themeMode,
        home: homescreen(),
      );
    });
  }
}
