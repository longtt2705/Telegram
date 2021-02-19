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
    // TODO: implement initState
    super.initState();
    currentPage = widget._pageController.initialPage;
    numberOfNotifications = <int>[0, 2, 4, 1];
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
      Icons.home,
      Icons.email,
      Icons.group,
      Icons.notifications
    ];

    return BottomAppBar(
      color: primaryColor,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: size.height * 0.08,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < 4; i++)
              Stack(
                children: [
                  Container(
                    margin: i.isOdd
                        ? EdgeInsets.only(right: size.width * 0.07)
                        : EdgeInsets.only(left: size.width * 0.07),
                    child: IconButton(
                      iconSize: size.width * 0.075,
                      icon: Icon(icons[i]),
                      color: i == currentPage ? Colors.white : Colors.black,
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
                      right: i.isEven ? 0 : size.width * 0.07,
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
      ),
    );
  }
}
