import 'package:UTS/Profile/profile.dart';
import 'package:UTS/register.dart';
import 'package:UTS/splash.dart';
import 'package:UTS/Profile/username.dart';
import 'package:flutter/material.dart';
import 'package:UTS/login.dart';
import 'package:UTS/checkout.dart';
import 'package:UTS/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:UTS/history.dart';
import 'package:UTS/Profile/username_changed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: HalamanLogin.id,
      home: Splash(),
      routes: {
        HalamanLogin.id:(context) => HalamanLogin(),
        RegisterScreen.id: (context) => RegisterScreen(),
        UserDisplayName.id: (context) => UserDisplayName(),
        UserDisplayNameChanged.id: (context) => UserDisplayNameChanged(),
        MainMenu.id: (context) => MainMenu(),
        CheckOut.id: (context) => CheckOut(),
        HalamanProfile.id: (context) => HalamanProfile(),
        HistoryOrder.id: (context) => HistoryOrder(),
      },
    );
  }
}
