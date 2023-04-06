<<<<<<< HEAD
import 'package:flutter/material.dart';
// import 'package:flutter_auth/responsive.dart';
import '../../../responsive.dart';
import '../../components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
=======
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutor_match_new/login_signup_auth/screens/StudentScreens/home_s.dart';
// import 'package:flutter_auth/responsive.dart';
import '../../../responsive.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/constants.dart';
import '../signup/signup_screen.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

<<<<<<< HEAD
class MobileLoginScreen extends StatelessWidget {
=======
class MobileLoginScreen extends StatefulWidget {
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
<<<<<<< HEAD
=======
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  TextEditingController emailconrtroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  Future<void> loginUser() async {
    var url = Uri.parse('http://43.205.215.181/api/auth/userlogin');
    var response = await http.post(url, body: {
      'email': emailconrtroller.text,
      'password': passcontroller.text,
    });

    if (response.statusCode == 200) {
      print(response.body);
      var fullbody = json.decode(response.body);
      Map<String, dynamic> usermap = fullbody['userdetails'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Home_s();
          },
        ),
      );
    } else {
      const SnackBar(content: Text('Wrong Credentials'));
    }
  }

  @override
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
<<<<<<< HEAD
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
=======
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailconrtroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      onSaved: (email) {},
                      decoration: const InputDecoration(
                        hintText: "Your email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        controller: passcontroller,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        cursorColor: kPrimaryColor,
                        decoration: const InputDecoration(
                          hintText: "Your password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            await loginUser();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                    // Hero(
                    //   tag: "login_btn",
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Login".toUpperCase(),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: defaultPadding),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
          ],
        ),
      ],
    );
  }
}
