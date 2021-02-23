import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color, textColor;
  final double circularValue;

  const RoundedButton({
    Key key,
    @required this.text,
    @required this.onPress,
    @required this.color,
    @required this.textColor,
    this.stretch = true,
    this.circularValue = 29,
  }) : super(key: key);

  final bool stretch;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: stretch ? size.width * 0.8 : null,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularValue),
          ),
          padding: stretch
              ? EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.025)
              : null,
          color: color,
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
