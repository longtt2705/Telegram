import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.onPress,
    this.color,
    this.textColor,
    this.stretch = true,
  }) : super(key: key);

  final bool stretch;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: stretch ? size.width * 0.8 : null,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
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
