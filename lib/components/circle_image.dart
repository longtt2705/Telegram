import 'package:flutter/material.dart';

class CircleImage extends StatefulWidget {
  final double size;
  final String url;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CircleImage(
      {Key key,
      @required this.size,
      @required this.url,
      this.borderWidth = 0,
      this.borderColor = Colors.transparent,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  _CircleImageState createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        margin: widget.padding,
        width: widget.size,
        height: widget.size,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: widget.borderColor, width: widget.borderWidth),
            image: new DecorationImage(
                fit: BoxFit.fitHeight, image: new NetworkImage(widget.url))));
  }
}
