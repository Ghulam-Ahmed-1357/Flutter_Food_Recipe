// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:food_recipe/contact.dart';
import 'package:food_recipe/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_recipe/login1.dart';
import 'package:food_recipe/privacy_policy.dart';
import 'package:food_recipe/setting_page.dart';
import 'package:food_recipe/signup.dart';
import 'package:food_recipe/splash.dart';
import 'package:food_recipe/terms_and_conditions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}
