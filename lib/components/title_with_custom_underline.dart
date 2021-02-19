import 'package:flutter/material.dart';

import '../constant.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    @required this.size,
    this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.029,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.01),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: size.height * 0.008,
                margin: EdgeInsets.only(right: size.width * 0.01),
                color: primaryColor.withOpacity(0.15)),
          )
        ],
      ),
    );
  }
}
