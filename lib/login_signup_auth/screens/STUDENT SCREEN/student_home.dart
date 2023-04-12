import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_match/login_signup_auth/screens/STUDENT%20SCREEN/s_drawer.dart';
import 'package:tutor_match/utils/Models/tutor.dart';
import 'package:tutor_match/utils/Sharedpref_serv.dart';

import '../../../api_services/Api_const.dart';
import 'package:http/http.dart' as http;

import '../../../utils/Models/student.dart';

class Student_home extends StatefulWidget {
  const Student_home({super.key});

  @override
  State<Student_home> createState() => _Student_homeState();
}

class _Student_homeState extends State<Student_home> {
  String uid = "";
  List<Tutor> tutorlist = [];
  bool tutorlistloaded = false;
  Student student = Student(name: "", email: "", phone: "", pincode: "");

  Future<void> getuserdata() async {
    String savedcheck = await Sharedpref_Serv.checksaved();
    print(savedcheck);
    // if (savedcheck == "true") {
    //   return;
    // }
    String id = await Sharedpref_Serv.getid();
    print(id);
    print(id);
    setState(() {
      uid = id;
    });

    var url = Uri.parse('${Api_const.auth}/user/getuserdata');
    var response = await http.post(url, body: {"uid": id});
    if (response.statusCode == 200) {
      var fullbody = json.decode(response.body);
      Map<String, dynamic> userlist = fullbody['userdetails'];

      Student student = Student(
          name: userlist['name'],
          email: userlist['email'],
          phone: userlist['phone'].toString(),
          pincode: userlist['pincode'].toString());
      print(student.name);
      Sharedpref_Serv.saveStudent(student);
    } else {
      Get.snackbar("Check again", "Network error",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> get_near_tutor() async {
    print("entered into get neat tutor");
    String pincode = await Sharedpref_Serv.getpincode();

    var url = Uri.parse('${Api_const.controller}/getteacherbylocation');

    var response = await http.post(url, body: {"pincode": pincode});

    if (response.statusCode == 200) {
      var fullbody = json.decode(response.body);
      List<dynamic> userlist = fullbody['teacherlist'];

      for (var i = 0; i < userlist.length; i++) {
        Tutor tutor = Tutor(
            name: userlist[i]['name'],
            email: userlist[i]['email'],
            phone: userlist[i]['phone'].toString(),
            pincode: userlist[i]['pincode'].toString());
        tutorlist.add(tutor);
      }

      print("tutor list length is ${tutorlist.length}");
      setState(() {
        tutorlistloaded = true;
      });
    } else {
      Get.snackbar("Check again", "Network error",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> getsavedstudent() async {
    Student? temp = await Sharedpref_Serv.getSavedStudent();

    setState(() {
      student = temp!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuserdata().then((value) => getsavedstudent()).then((value) {
      get_near_tutor();
    });
    // getsavedstudent();
    // get_near_tutor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Home'),
      ),
      drawer: S_drawer(student: student),
      body: tutorlistloaded
          ? ListView.builder(
              itemCount: tutorlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tutorlist[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tutorlist[index].email),
                      Text(tutorlist[index].phone),
                      Text(tutorlist[index].pincode),
                    ],
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
