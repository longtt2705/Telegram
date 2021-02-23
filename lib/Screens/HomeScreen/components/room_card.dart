import 'package:flutter/material.dart';
import 'package:telegram/components/button_with_leading_icon.dart';
import 'package:telegram/constant.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key key,
    @required this.size,
    @required this.url,
    @required this.name,
    @required this.description,
    @required this.distance,
    @required this.members,
  }) : super(key: key);

  final Size size;
  final String url;
  final String name;
  final String description;
  final double distance;
  final int members;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            width: 240,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(url)),
                  ListTile(
                    title: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                    subtitle: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [Icon(Icons.person), Text("$members members")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Text("$distance kilometers away")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  ButtonWithLeadingIcon(
                    color: primaryColor,
                    textColor: Colors.white,
                    size: size,
                    icon: Icons.group_add,
                    text: 'Join Room',
                    onPress: () {},
                  )
                ],
              ),
              elevation: 5,
            )),
      ],
    );
  }
}
