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
              top: -size.height * 0.07,
              right: -size.width * 0.15,
              child: SvgPicture.asset(
                "assets/icons/blob1.svg",
                width: size.width * 0.5,
              )),
          Positioned(
              bottom: -size.height * 0.15,
              left: size.width * 0.5,
              child: SvgPicture.asset(
                "assets/icons/blob3.svg",
                width: size.width * 0.4,
              )),
          Positioned(
              bottom: size.height * 0.4,
              left: -size.width * 0.2,
              child: SvgPicture.asset(
                "assets/icons/blob4.svg",
                width: size.width * 0.4,
              )),
          child,
        ],
      ),
    );
  }
}
