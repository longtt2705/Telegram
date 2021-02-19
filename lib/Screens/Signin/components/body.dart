import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram/Screens/Layout/layout.dart';
import 'package:telegram/Screens/Signin/components/background.dart';
import 'package:telegram/Screens/Signup/signup_screen.dart';
import 'package:telegram/components/already_have_an_account_check.dart';
import 'package:telegram/components/rounded_button.dart';
import 'package:telegram/components/rounded_input_field.dart';
import 'package:telegram/components/rounded_password_field.dart';
import 'package:telegram/constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN IN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/images/connect1.svg",
                width: size.width * 0.8,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: "Your phone...",
                icon: Icons.phone,
                textInputType: TextInputType.number,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: "Your password...",
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                color: primaryColor,
                text: "SIGN IN",
                onPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Layout()),
                      (route) => false);
                },
                textColor: Colors.white,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                isLogin: true,
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
