import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -70,
              right: -66,
              child: SvgPicture.asset(
                "assets/icons/blob3.svg",
                width: size.width * 0.5,
              )),
          Positioned(
              bottom: -85,
              left: -70,
              child: SvgPicture.asset(
                "assets/icons/blob2.svg",
                width: size.width * 0.55,
              )),
          child,
        ],
      ),
    );
  }
}
