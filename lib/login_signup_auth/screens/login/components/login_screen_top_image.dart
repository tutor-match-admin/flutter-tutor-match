import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
<<<<<<< HEAD
        Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding * 2),
=======
        const SizedBox(
          height: 50,
        ),
        const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: defaultPadding * 2),
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/login.svg"),
            ),
            const Spacer(),
          ],
        ),
<<<<<<< HEAD
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
=======
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
>>>>>>> 59b60b5dd8e279950ee50c3a519f13331e8bd585
