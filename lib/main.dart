import 'package:flutter/material.dart';
import 'package:tutor_match_new/role/role.dart';
<<<<<<< HEAD
import 'dashbord/screens/base_screen.dart';
=======
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
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
<<<<<<< HEAD
      home: const BaseScreen(),
=======
      home: OnbordingScreen(),
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
    );
  }
}
