import 'package:flutter/material.dart';
import 'package:telegram/Screens/HomeScreen/components/person_card.dart';
import 'package:telegram/Screens/HomeScreen/components/title_with_trailing_button.dart';

class NearFriendBlock extends StatelessWidget {
  const NearFriendBlock({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TitleWithTralingButton(
          title: "People you might know",
          size: size,
          onPress: () {},
        ),
        Container(
          height: 400,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PersonCard(
                  size: size,
                  url: 'https://placeimg.com/640/480/any',
                  name: "Nguyễn Hoàng Mai Phương",
                  description:
                      "I'm just a little bit caught in the middle \nLife is a maze, and love is a riddle",
                  distance: 5.0,
                  mutualFriends: 15,
                );
              }),
        )
      ],
    );
  }
}
