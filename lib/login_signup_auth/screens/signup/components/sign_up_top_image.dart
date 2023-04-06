import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
<<<<<<< HEAD
        Text(
          "Sign Up".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding),
=======
        Container(
          height: 50,
        ),
        Text(
          "Sign Up".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(height: defaultPadding),
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer(),
          ],
        ),
<<<<<<< HEAD
        SizedBox(height: defaultPadding),
=======
        const SizedBox(height: defaultPadding),
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
      ],
    );
  }
}
