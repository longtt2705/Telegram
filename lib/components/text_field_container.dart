import 'package:flutter/material.dart';

import '../constant.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: primaryLighterColor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
