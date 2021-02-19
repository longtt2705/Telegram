import 'package:flutter/material.dart';
import 'package:telegram/components/rounded_button.dart';
import 'package:telegram/components/title_with_custom_underline.dart';

import '../../../constant.dart';

class TitleWithTralingButton extends StatelessWidget {
  const TitleWithTralingButton({
    Key key,
    @required this.size,
    @required this.onPress,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleWithCustomUnderline(size: size, title: title),
        Spacer(),
        RoundedButton(
          color: primaryColor,
          text: "Refresh",
          onPress: onPress,
          textColor: Colors.white,
          stretch: false,
        ),
      ],
    );
  }
}
