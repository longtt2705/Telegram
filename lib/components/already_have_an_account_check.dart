import 'package:flutter/material.dart';

import '../constant.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool isLogin;
  final Function onTap;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.isLogin = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? "Don't have an Account? " : "Already have an Account? ",
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            isLogin ? "Sign Up" : "Sign In",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
