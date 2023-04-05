import 'package:flutter/material.dart';
import '../../../responsive.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/constants.dart';
import '../Login/login_screen.dart';
import '../StudentScreens/home_s.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> signupUser() async {
    var url = Uri.parse('http://43.205.215.181/api/auth/usersignup');

    var response = await http.post(url, body: {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController,
      'phone': _phoneController.text,
    });

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Home_s();
          },
        ),
      );
    } else {
      print("User not Registered");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SignUpScreenTopImage(),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            onSaved: (email) {},
                            decoration: const InputDecoration(
                              hintText: "Your Name",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: TextFormField(
                              controller: _emailController,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              cursorColor: kPrimaryColor,
                              decoration: const InputDecoration(
                                hintText: "Your email",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: Icon(Icons.email),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              cursorColor: kPrimaryColor,
                              decoration: const InputDecoration(
                                hintText: "Your Number",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: Icon(Icons.phone),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: TextFormField(
                              controller: _passwordController,
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
                          const SizedBox(height: defaultPadding / 2),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Sign Up".toUpperCase()),
                          ),
                          const SizedBox(height: defaultPadding),
                          AlreadyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
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
                ],
              ),
              // const SocalSignUp()
            ],
          ),
        ),
        desktop: Row(
          children: [
            const Expanded(
              child: SignUpScreenTopImage(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 450,
                    child: SignUpForm(),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  // SocalSignUp()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class MobileSignupScreen extends StatefulWidget {
//   const MobileSignupScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MobileSignupScreen> createState() => _MobileSignupScreenState();
// }

// class _MobileSignupScreenState extends State<MobileSignupScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
