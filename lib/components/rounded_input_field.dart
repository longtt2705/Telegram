import 'package:flutter/material.dart';
import 'package:telegram/components/text_field_container.dart';

import '../constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final Function validator;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: validator,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            icon: Icon(
              icon,
              color: primaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
