import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_match/login_signup_auth/screens/TUTOR%20SCREEN/t_drawer.dart';
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
  final formkey = GlobalKey<FormState>();
  TextEditingController feescontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController domaincontroller = TextEditingController();

  Future<void> getuserdata() async {
    String savedcheck = await Sharedpref_Serv.checksaved();
    
    print(savedcheck);
    String id = await Sharedpref_Serv.getid();

    setState(() {
      uid = id;
    });
if (savedcheck == "false") {
      return;
    }
    var url = Uri.parse('${Api_const.auth}/teacher/getteacherdata');
    var response = await http.post(url, body: {"uid": id});
    print(response.body);
    if (response.statusCode == 200) {
      var fullbody = json.decode(response.body);
      Map<String, dynamic> userlist = fullbody['userdetails'];

      Tutor tutor = Tutor(
          name: userlist['name'],
          email: userlist['email'],
          phone: userlist['phone'].toString(),
          pincode: userlist['pincode'].toString(),
          fees: userlist['fees'].toString(),
          domain: userlist['domain'].toString(),
        pastexperience: userlist['pastexperience'].toString());
      print(tutor.name);

      setState(() {
        this.tutor = tutor;
        tutordataloaded = true;
      });
      Sharedpref_Serv.saveTutor(tutor);
    } else {
      Get.snackbar("Check again", "Network error",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> updateessentialtutordata() async {
    var url = Uri.parse('${Api_const.auth}/teacher/updateadditionaldetails');
    var response = await http.post(url, body: {
      "uid": uid,
      "fees": feescontroller.text.trim(),
      "pastexperience": experiencecontroller.text.trim(),
      "domain": domaincontroller.text.trim(),
    });
    if (response.statusCode == 200) {
      var fullbody = json.decode(response.body);
      Map<String, dynamic> userlist = fullbody['userdetails'];

      Tutor tutor = Tutor(
          name: userlist['name'],
          email: userlist['email'],
          phone: userlist['phone'].toString(),
          pincode: userlist['pincode'].toString(),
          fees: userlist['fees'].toString(),
          domain: userlist['domain'].toString(),
          pastexperience: userlist['pastexperience'].toString());
      Sharedpref_Serv.saveTutor(tutor);
      clearcontrollers();
      Get.snackbar("Done", "Data updated",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Check again", "Network error",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> getsavedstudent() async {
    Tutor? temp = await Sharedpref_Serv.getSavedTutor();

    setState(() {
      tutor = temp!;
      tutordataloaded = true;
    });
  }

  void clearcontrollers() {
    feescontroller.clear();
    experiencecontroller.clear();
    domaincontroller.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata().then((value) => getsavedstudent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Home'),
      ),
      drawer: T_drawer(
        tutor: tutor,
      ),
      body: Column(
        children: [
          tutordataloaded
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: feescontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your fees",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: experiencecontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your experience",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: domaincontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your domain",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await updateessentialtutordata();
                          } else {
                            print("not validated");
                          }
                        },
                        child: const Text("Update details"))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
