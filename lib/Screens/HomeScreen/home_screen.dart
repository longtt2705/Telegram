import 'package:flutter/material.dart';
import 'package:telegram/Screens/HomeScreen/components/near_room_block.dart';

import 'components/home_screen_status_bar.dart';
import 'components/near_friend_block.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = ["ASF", "ASF", "ZXX"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: size.height * 0.2,
            backgroundColor: Colors.transparent,
            floating: false,
            flexibleSpace: HomeScreenStatusBar(
              size: size,
            ),
          ),
        ];
      },
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          SizedBox(height: size.height * 0.02),
          NearFriendBlock(size: size),
          NearRoomBlock(size: size),
        ],
      ),
    );
  }
}
