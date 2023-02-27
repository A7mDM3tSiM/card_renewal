import 'package:card_renewal/app_screens/enter_data.dart';
import 'package:card_renewal/app_screens/login.dart';
import 'package:card_renewal/app_screens/notification.dart';
import 'package:card_renewal/app_screens/payment.dart';
import 'package:flutter/material.dart';
import 'app_screens/firist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ID Card',
      debugShowCheckedModeBanner: false,
      home: payment(1),
    );
  }
}
