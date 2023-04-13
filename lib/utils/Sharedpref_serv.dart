import 'package:shared_preferences/shared_preferences.dart';

import 'Models/student.dart';
import 'Models/tutor.dart';

class Sharedpref_Serv {
  static Future<void> saveid(String id, String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('usertype', type);
  }

  static Future<String> getusertype() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('usertype');
    return id != null ? id.toString() : "";
  }

  static Future<String> getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id')!;
    return id.toString();
  }

  static Future<String> getpincode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pin = prefs.getString('Pincode')!;
    return pin.toString() ?? '';
  }


  //set pincode
  static Future<void> setpincode(String pincode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Pincode', pincode);
  }

  static Future<void> saveTutor(Tutor tutor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', tutor.name);
    prefs.setString('Email', tutor.email);
    prefs.setString('Phone', tutor.phone);
    prefs.setString('Pincode', tutor.pincode);
    if(tutor.fees == null){
      prefs.setString('Fees', "");
    }else{
      prefs.setString('Fees', tutor.fees!);
    }

    if(tutor.domain == null){
      prefs.setString('Domain', "");
    }else{
      prefs.setString('Domain', tutor.domain!);
    }
    if(tutor.pastexperience == null){
      prefs.setString('Pastexperience', "");
    }else{
      prefs.setString('Pastexperience', tutor.pastexperience!);
    }
    prefs.setString('saved', "true");
  }

  static Future<void> saveStudent(Student student) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', student.name);
    prefs.setString('Email', student.email);
    prefs.setString('Phone', student.phone);
    prefs.setString('Pincode', student.pincode);
    prefs.setString('saved', "true");
  }

  static Future<String> checksaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? type = prefs.getString('saved');
    return type?.toString() ?? '';
  }

  static Future<Student?> getSavedStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('Name');
    String? email = prefs.getString('Email');
    String? phone = prefs.getString('Phone');
    String? pincode = prefs.getString('Pincode');
    prefs.setString('saved', "true");

    if (name != null && email != null && phone != null && pincode != null) {
      return Student(name: name, email: email, phone: phone, pincode: pincode);
    } else {
      return null;
    }
  }

  static Future<Tutor?> getSavedTutor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('Name');
    String? email = prefs.getString('Email');
    String? phone = prefs.getString('Phone');
    String? pincode = prefs.getString('Pincode');

    if (name != null && email != null && phone != null && pincode != null) {
      return Tutor(name: name, email: email, phone: phone, pincode: pincode);
    } else {
      return null;
    }
  }

  static Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
