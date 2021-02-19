import 'package:flutter/material.dart';
import 'package:telegram/components/text_field_container.dart';

import '../constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final hintText;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: Icon(Icons.visibility, color: primaryColor),
            border: InputBorder.none),
      ),
    );
  }
}
