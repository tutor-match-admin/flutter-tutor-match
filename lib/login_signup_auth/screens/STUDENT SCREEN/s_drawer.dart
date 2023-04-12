import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tutor_match/login_signup_auth/screens/login2/all_login.dart';
import 'package:tutor_match/utils/Models/student.dart';

import '../../../utils/Sharedpref_serv.dart';

class S_drawer extends StatefulWidget {
  Student student;
  S_drawer({required this.student, super.key});

  @override
  State<S_drawer> createState() => _S_drawerState();
}

class _S_drawerState extends State<S_drawer> {
  Future<void> cleardata() async {
    Sharedpref_Serv.clearAllData();
    Get.to(() => const Login());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
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
                      widget.student.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  accountName: Text(widget.student.email),
                  accountEmail: Text(widget.student.name),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
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
