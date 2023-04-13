import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
    String id = await Sharedpref_Serv.getid();
    print(id);
    print(id);
    setState(() {
      uid = id;
    });
    if (savedcheck == "true") {
      return;
    }

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
    print(pincode);
    print(pincode);
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
      Get.snackbar("Check again", "Network error ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> getsavedstudent() async {
    Student? temp = await Sharedpref_Serv.getSavedStudent();

    setState(() {
      student = temp!;
    });
  }

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
      });
      await placemarkFromCoordinates(
              _currentPosition!.latitude, _currentPosition!.longitude)
          .then((List<Placemark> placemarks) async {
        Placemark place = placemarks[0];
        String pin = place.postalCode.toString();
        Sharedpref_Serv.setpincode(pin);
        await updatepincode(pin).then((value) {
          setState(() {
            tutorlist = [];
          });
          get_near_tutor();
        });
      }, onError: (e) {
        print(e);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> updatepincode(String pincode) async {
    String id = await Sharedpref_Serv.getid();
    var url = Uri.parse('${Api_const.auth}/user/updateuserlocation');

    var response = await http.post(url, body: {"uid": id, "pincode": pincode});
    if (response.statusCode == 200) {
      getsavedstudent();
      Get.snackbar("Hurray!", "Location updated",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Can't access your location", "Grant location permission",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuserdata().then((value) => getsavedstudent()).then((value) {
      get_near_tutor().then((value) => getCurrentPosition());
    });
    // getsavedstudent();
    // get_near_tutor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcaf0f8),
      appBar: AppBar(
        title: const Text('Student Home'),
      ),
      drawer: S_drawer(student: student),
      body: Column(
        children: [
          Text("Welcome ${student.name}",
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

          Text("Current Pincode : ${student.pincode}",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          // Container(
          //   padding: const EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //       color: const Color.fromRGBO(244, 243, 243, 1),
          //       borderRadius: BorderRadius.circular(15)),
          //   child: const TextField(
          //     decoration: InputDecoration(
          //         border: InputBorder.none,
          //         prefixIcon: Icon(
          //           Icons.search,
          //           color: Colors.black87,
          //         ),
          //         hintText: "Search you're looking for",
          //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          //   ),
          // ),
          Builder(builder: (context) {
            return Expanded(
              child: tutorlistloaded
                  ? ListView.builder(
                      itemCount: tutorlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Card(
                            color: const Color(0xff457b9d),
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                tutorlist[index].name,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    "Email : ${tutorlist[index].email}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Name : ${tutorlist[index].name}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Phone :${tutorlist[index].phone}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Pincode :${tutorlist[index].pincode}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
