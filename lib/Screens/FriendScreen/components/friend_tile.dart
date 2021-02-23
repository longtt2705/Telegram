import 'package:flutter/material.dart';
import 'package:telegram/components/circle_image.dart';
import 'package:telegram/components/status_change_button.dart';

class FriendTile extends StatefulWidget {
  const FriendTile({
    Key key,
    @required this.size,
    @required this.url,
    @required this.name,
  }) : super(key: key);

  final Size size;
  final String url;
  final String name;

  @override
  _FriendTileState createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  String status = "HEHE boizzz";
  bool isOnline = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        title: Text(widget.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(status),
        onTap: () {},
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            elevation: 0,
            icon: Icon(Icons.more_horiz),
            items: [
              DropdownMenuItem<String>(
                value: "Profile",
                child: new Text("Profile"),
              ),
              DropdownMenuItem<String>(
                value: "Unfriend",
                child: new Text("Unfriend"),
              ),
              DropdownMenuItem<String>(
                value: "Block",
                child: new Text("Block"),
              )
            ],
            onChanged: (_) {},
          ),
        ));
  }
}
