import 'package:flutter/material.dart';
import 'package:telegram/Screens/ChatScreen/chat_screen.dart';
import 'package:telegram/Screens/FriendScreen/friend_screen.dart';
import 'package:telegram/Screens/HomeScreen/home_screen.dart';
import 'package:telegram/Screens/ProfileScreen/profile_screen.dart';

import 'components/bottom_nav_bar.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController _pageController;
  final GlobalKey<BottomNavBarState> _key = GlobalKey();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: PageView(
        onPageChanged: (page) {
          _key.currentState.refresh();
        },
        controller: _pageController,
        children: [HomeScreen(), ChatScreen(), FriendScreen(), ProfileScreen()],
      ),
      bottomNavigationBar:
          BottomNavBar(key: _key, pageController: _pageController),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      title: Image.asset(
        "assets/icons/text_logo.png",
        width: size.width * 0.3,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
      elevation: 0,
    );
  }
}
