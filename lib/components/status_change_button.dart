import 'package:flutter/material.dart';

class StatusChangeButton extends StatefulWidget {
  final width;
  final double borderWidth;
  final readOnly;
  final Color borderColor;

  const StatusChangeButton(
      {Key key,
      @required this.width,
      @required this.borderColor,
      this.borderWidth = 3.0,
      this.readOnly = false})
      : super(key: key);
  @override
  _StatusChangeButtonState createState() => _StatusChangeButtonState();
}

class _StatusChangeButtonState extends State<StatusChangeButton> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.readOnly)
          setState(() {
            isOnline = !isOnline;
          });
      },
      child: Container(
        width: widget.width,
        height: widget.width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: widget.borderColor, width: widget.borderWidth),
          color: isOnline ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
