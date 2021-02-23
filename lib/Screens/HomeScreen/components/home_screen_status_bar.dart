import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telegram/components/status_change_button.dart';
import 'package:telegram/Screens/SearchScreen/search_screen.dart';
import 'package:telegram/components/circle_image.dart';

import '../../../constant.dart';

class HomeScreenStatusBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeScreenStatusBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.2,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.18,
              padding: EdgeInsets.only(
                  left: size.width * 0.02, bottom: size.height * 0.04),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(29),
                      bottomRight: Radius.circular(29))),
              child: Row(
                children: [
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.03),
                      width: size.width * 0.2,
                      child: CircleImage(
                        size: size.width * 0.2,
                        url: 'https://placeimg.com/640/480/any',
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: StatusChangeButton(
                        borderColor: primaryColor,
                        width: size.width * 0.06,
                      ),
                    )
                  ]),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.02 * size.height,
                        ),
                        Row(
                          children: [
                            Text(
                              "Hi, Trần Thành Long!!!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: TextField(
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: size.height * 0.06,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: primaryColor.withOpacity(0.23))
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search something...",
                          hintStyle: TextStyle(
                              color: primaryColor, fontStyle: FontStyle.italic),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(Icons.search)),
                      readOnly: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                    )))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0);
}
