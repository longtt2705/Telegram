import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram/Screens/Signin/signin_screen.dart';
import 'package:telegram/Screens/Signup/signup_screen.dart';
import 'package:telegram/Screens/Welcome/components/background.dart';
import 'package:telegram/components/rounded_button.dart';
import 'package:telegram/constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME TO TELEGRAM",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SvgPicture.asset(
            "assets/images/chatting.svg",
            height: size.height * 0.45,
          ),
          RoundedButton(
            text: "SIGN IN",
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedButton(
            text: "SIGN UP",
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            color: primaryLightColor,
            textColor: Colors.white,
          )
        ],
      ),
    ));
  }
}
