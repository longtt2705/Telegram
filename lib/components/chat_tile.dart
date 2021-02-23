import 'package:flutter/material.dart';
import 'package:telegram/components/status_change_button.dart';

import 'circle_image.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    @required Key key,
    @required this.size,
    @required this.url,
    @required this.name,
    this.message,
    this.timeSending,
  }) : super(key: key);

  final Size size;
  final String url;
  final String name;
  final String message;
  final String timeSending;

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  bool isOnline;
  bool seenMessage;

  @override
  void initState() {
    super.initState();
    isOnline = true;
    seenMessage = false;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key,
      child: ListTile(
        leading: Stack(
          children: [
            CircleImage(
              size: widget.size.width * 0.15,
              url: widget.url,
            ),
            if (isOnline)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: StatusChangeButton(
                      borderColor: Colors.white,
                      width: widget.size.width * 0.05))
          ],
        ),
        key: widget.key,
        title: Text(widget.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: seenMessage ? FontWeight.normal : FontWeight.bold)),
        subtitle: Text(widget.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: seenMessage ? FontWeight.normal : FontWeight.bold)),
        trailing: Text(
          widget.timeSending,
          style: TextStyle(
              fontWeight: seenMessage ? FontWeight.normal : FontWeight.bold),
        ),
        onTap: () {},
      ),
    );
  }
}
