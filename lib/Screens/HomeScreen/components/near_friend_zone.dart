import 'package:flutter/material.dart';
import 'package:telegram/Screens/HomeScreen/components/person_card.dart';

class NearFriendZone extends StatelessWidget {
  const NearFriendZone({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: 3,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return PersonCard(
              size: size,
              url: 'https://placeimg.com/640/480/any',
              name: "Nguyễn Hoàng Mai Phương",
              description:
                  "I'm just a little bit caught in the middle \nLife is a maze, and love is a riddle",
              distance: 5.0,
            );
          }),
    );
  }
}
