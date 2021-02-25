import 'package:flutter/material.dart';

import '../../../constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
    @required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int currentPage;
  var numberOfNotifications;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    currentPage = widget._pageController.initialPage;
    numberOfNotifications = <int>[0, 2, 4, 0];
  }

  void refresh() {
    setState(() {
      currentPage = widget._pageController.page.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List icons = <IconData>[
      Icons.home_outlined,
      Icons.email_outlined,
      Icons.group_outlined,
      Icons.person_outline_rounded
    ];

    final List iconSelected = <IconData>[
      Icons.home,
      Icons.email,
      Icons.group,
      Icons.person
    ];

    return Container(
      height: size.height * 0.07,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.2))
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < icons.length; i++)
            Stack(
              children: [
                Container(
                  // margin: i.isOdd
                  //     ? EdgeInsets.only(right: size.width * 0.07)
                  //     : EdgeInsets.only(left: size.width * 0.07),
                  child: IconButton(
                    iconSize: size.width * 0.075,
                    icon: i == currentPage
                        ? Icon(iconSelected[i])
                        : Icon(
                            icons[i],
                            color: Colors.grey,
                          ),
                    color: i == currentPage ? primaryColor : Colors.black,
                    onPressed: () {
                      if (widget._pageController.hasClients) {
                        widget._pageController
                            .animateToPage(
                              i,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                            )
                            .then((value) => {refresh()});
                      }
                    },
                  ),
                ),
                if (numberOfNotifications[i] != 0)
                  Positioned(
                    right: 0,
                    top: size.height * 0.01,
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.045,
                      height: size.width * 0.045,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.greenAccent[700]),
                      child: Text(
                        numberOfNotifications[i].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
              ],
            )
        ],
      ),
    );
  }
}
