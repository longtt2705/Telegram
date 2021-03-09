import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram/Screens/HomeScreen/home_screen.dart';
import 'package:telegram/Screens/Signin/signin_screen.dart';
import 'package:telegram/Screens/Signup/components/background.dart';
import 'package:telegram/components/already_have_an_account_check.dart';
import 'package:telegram/components/rounded_button.dart';
import 'package:telegram/components/rounded_input_field.dart';
import 'package:telegram/components/rounded_password_field.dart';
import 'package:telegram/constant.dart';
import 'package:form_validator/form_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as ss;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String phone;
  String password;
  String passwordConfirm;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    phone = "";
    password = "";
    passwordConfirm = "";
    isLoading = false;
  }

  bool isValidate(String validation) {
    if (validation != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(validation)));
      return true;
    }
    return false;
  }

  void signUp() async {
    var phoneValidate = ValidationBuilder()
        .phone()
        .minLength(10, "Phone must have 10 digits")
        .maxLength(10, "Phone must have 10 digits")
        .build()(phone);
    var passwordValidate = ValidationBuilder()
        .minLength(6, "Password must have at least 6 characters")
        .build()(password);
    if (isValidate(phoneValidate) || isValidate(passwordValidate)) return;
    if (password != passwordConfirm) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Your password and confirm password must be the same!")));
    }

    setState(() {
      isLoading = true;
    });
    try {
      var dio = Dio();
      var response = await dio.post('http://10.0.2.2:8000/account/signup',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode({"phone": phone, "password": password}));

      if (response.data["status"] == statusOk) {
        final storage = new ss.FlutterSecureStorage();
        await storage.write(key: "token", value: response.data["message"]);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.data["message"])));
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height,
            child: Background(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SvgPicture.asset(
                    "assets/images/connect2.svg",
                    width: size.width * 0.8,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RoundedInputField(
                    hintText: "Your phone...",
                    icon: Icons.phone,
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                  RoundedPasswordField(
                    hintText: "Your password...",
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  RoundedPasswordField(
                    hintText: "Confirm password...",
                    onChanged: (value) {
                      passwordConfirm = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RoundedButton(
                    color: primaryColor,
                    text: "SIGN UP",
                    onPress: signUp,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  AlreadyHaveAnAccountCheck(
                    isLogin: false,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                  )
                ],
              ),
            ),
          ),
          isLoading
              ? Container(
                  height: size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: primaryColor,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          primaryLighterColor),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
