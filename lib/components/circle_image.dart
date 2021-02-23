import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double size;
  final String url;

  const CircleImage({Key key, @required this.size, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fitHeight, image: new NetworkImage(url))));
  }
}
