// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class Util{
  static void showError(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  static void showSuccess(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }
  static Text textStyleForHeading(String text){
     return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
  }
  static Text textStyleForText(String text){
     return Text(
    text,
    style: TextStyle(
      fontSize: 16,
    ),
  );
  }
}