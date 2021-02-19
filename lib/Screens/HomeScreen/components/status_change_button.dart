import 'package:flutter/material.dart';

class StatusChangeButton extends StatefulWidget {
  @override
  _StatusChangeButtonState createState() => _StatusChangeButtonState();
}

class _StatusChangeButtonState extends State<StatusChangeButton> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          isOnline = !isOnline;
        });
      },
      child: Container(
        width: size.width * 0.05,
        height: size.width * 0.05,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOnline ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
