import 'package:flutter/material.dart';
import 'package:tutor_match_new/role/role.dart';
import 'dashbord/screens/base_screen.dart';
import 'onbording/onbording_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BaseScreen(),
    );
  }
}
