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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget._pageController.initialPage;
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
      Icons.search
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
              IconButton(
                iconSize: size.width * 0.075,
                padding: i.isOdd
                    ? EdgeInsets.only(right: size.width * 0.07)
                    : EdgeInsets.only(left: size.width * 0.07),
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
          ],
        ),
      ),
    );
  }
}
