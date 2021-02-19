import 'package:flutter/material.dart';
import 'package:telegram/components/rounded_button.dart';
import 'package:telegram/components/title_with_custom_underline.dart';
import 'package:telegram/constant.dart';

import 'components/home_screen_status_bar.dart';
import 'components/near_friend_zone.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = ["ASF", "ASF", "ZXX"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        HomeScreenStatusBar(size: size),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            children: [
              TitleWithCustomUnderline(size: size, title: "Friends near you"),
              Spacer(),
              RoundedButton(
                color: primaryColor,
                text: "Refresh",
                onPress: () {},
                textColor: Colors.white,
                stretch: false,
              ),
            ],
          ),
        ),
        NearFriendZone(size: size)
      ],
    );
  }
}
