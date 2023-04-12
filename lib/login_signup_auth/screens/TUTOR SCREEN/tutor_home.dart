import 'package:flutter/material.dart';

class Tutor_home extends StatefulWidget {
  const Tutor_home({super.key});

  @override
  State<Tutor_home> createState() => _Tutor_homeState();
}

class _Tutor_homeState extends State<Tutor_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Home'),
      ),
      body: const Placeholder(),
    );
  }
}
