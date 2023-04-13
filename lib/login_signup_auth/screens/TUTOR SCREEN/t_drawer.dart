import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_match/login_signup_auth/screens/signup2/student_signup.dart';
import 'package:tutor_match/utils/Models/student.dart';
import 'package:tutor_match/utils/Models/tutor.dart';

import '../../../utils/Sharedpref_serv.dart';

class T_drawer extends StatefulWidget {
  Tutor tutor;
  T_drawer({Key? key, required this.tutor}) : super(key: key);
  @override
  State<T_drawer> createState() => _T_drawerState();
}

class _T_drawerState extends State<T_drawer> {
  Future<void> cleardata() async {
    Sharedpref_Serv.clearAllData();
    Get.offAll(() => const StudentSignup());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff457b9d),
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            // decoration: const BoxDecoration(
            //   color: Colors.blue,
            // ),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    // backgroundImage: NetworkImage(userAvatarUrl),
                    backgroundColor: Colors.grey,
                    child: Text(
                      widget.tutor.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  accountName: Text(widget.tutor.email),
                  accountEmail: Text(widget.tutor.name),
                  decoration: const BoxDecoration(
                    color: Color(0xffa8dadc),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon:
                            const Icon(Icons.contact_mail, color: Colors.white),
                        onPressed: () => null,
                      ),
                      title: const Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () => null,
                      ),
                      title: const Text(
                        'Update profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: () => null,
                      ),
                      title: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        Get.defaultDialog(
                            title: "logout!!!",
                            titleStyle: const TextStyle(fontSize: 18.0),
                            middleText: "do you wanna logout",
                            middleTextStyle: const TextStyle(fontSize: 15),
                            backgroundColor: Colors.white,
                            // radius: 80.0,
                            textCancel: "NO",
                            cancelTextColor: Colors.black,
                            textConfirm: "YES",
                            confirmTextColor: Colors.black,
                            onConfirm: () async {
                              await cleardata();
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
