import 'package:flutter/material.dart';
import 'package:ezpedal/phone2.dart';
import 'package:ezpedal/otp.dart';
import 'package:ezpedal/success.dart';
import 'package:ezpedal/home.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone':(context) => const LoginScreen(),
      'otp':(context) => const MyOtp(),
      'success': (context) => const SuccessfulLogin(),
      'home': (context) => const HomePage(),
    },
  ));
}