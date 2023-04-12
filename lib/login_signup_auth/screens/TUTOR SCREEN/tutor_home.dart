import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_match/utils/Models/tutor.dart';

import '../../../api_services/Api_const.dart';
import '../../../utils/Models/student.dart';
import 'package:http/http.dart' as http;

import '../../../utils/Sharedpref_serv.dart';

class Tutor_home extends StatefulWidget {
  const Tutor_home({super.key});

  @override
  State<Tutor_home> createState() => _Tutor_homeState();
}

class _Tutor_homeState extends State<Tutor_home> {
  String uid = "";
  List<Student> studentlist = [];
  bool tutordataloaded = false;
  Tutor tutor = Tutor(name: "", email: "", phone: "", pincode: "");

  Future<void> getuserdata() async {
    String savedcheck = await Sharedpref_Serv.checksaved();

    String id = await Sharedpref_Serv.getid();
    setState(() {
      uid = id;
    });

    var url = Uri.parse('${Api_const.auth}/teacher/getteacherdata');
    var response = await http.post(url, body: {"uid": id});
    if (response.statusCode == 200) {
      var fullbody = json.decode(response.body);
      Map<String, dynamic> userlist = fullbody['userdetails'];

      Tutor tutor = Tutor(
          name: userlist['name'],
          email: userlist['email'],
          phone: userlist['phone'].toString(),
          pincode: userlist['pincode'].toString());
      Sharedpref_Serv.saveTutor(tutor);
    } else {
      Get.snackbar("Check again", "Network error",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> getsavedstudent() async {
    Tutor? temp = await Sharedpref_Serv.getSavedTutor();

    setState(() {
      tutor = temp!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
    getsavedstudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Home'),
      ),
      body: tutordataloaded
          ? Column(
              children: [
                Text(tutor.name),
                Text(tutor.email),
                Text(tutor.phone),
                Text(tutor.pincode),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
