import 'package:flutter/material.dart';

class ButtonWithLeadingIcon extends StatelessWidget {
  const ButtonWithLeadingIcon(
      {Key key,
      @required this.size,
      @required this.text,
      @required this.icon,
      @required this.onPress,
      @required this.color,
      @required this.textColor})
      : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final Function onPress;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: text.length > 0
              ? EdgeInsets.only(right: size.width * 0.02)
              : EdgeInsets.zero,
          onPressed: onPress,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
              ),
              if (text.length > 0) SizedBox(width: size.width * 0.02),
              if (text.length > 0)
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor),
                )
            ],
          )),
    );
  }
}
