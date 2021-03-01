import 'package:flutter/material.dart';
import 'package:telegram/components/text_field_container.dart';

import '../constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final hintText;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isHidden,
        style: TextStyle(color: Colors.white),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: IconButton(
              icon: isHidden
                  ? Icon(Icons.visibility, color: primaryColor)
                  : Icon(Icons.visibility_off, color: primaryColor),
              onPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            ),
            border: InputBorder.none),
      ),
    );
  }
}
