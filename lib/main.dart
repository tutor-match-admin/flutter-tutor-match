import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tutor_match/login_signup_auth/screens/STUDENT%20SCREEN/student_home.dart';
import 'package:tutor_match/login_signup_auth/screens/TUTOR%20SCREEN/tutor_home.dart';
import 'package:tutor_match/login_signup_auth/screens/signup2/student_signup.dart';
import 'package:tutor_match/login_signup_auth/screens/signup2/tutor_signup.dart';
import 'package:tutor_match/utils/Sharedpref_serv.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

Future<int> checkusertype() async {
  String usertype = await Sharedpref_Serv.getusertype();
  print("usertype is $usertype");
  if (usertype == "tutor") {
    return 1;
  } else if (usertype == "student") {
    return 2;
  }
  return 0;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: OnbordingScreen(),
        home: FutureBuilder(
          future: checkusertype(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 1) {
                return const Tutor_home();
              } else if (snapshot.data == 2) {
                return const Student_home();
              } else {
                return const TutorSignup();
              }
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}
