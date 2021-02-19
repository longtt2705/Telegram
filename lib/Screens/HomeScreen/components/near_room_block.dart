import 'package:flutter/material.dart';
import 'package:telegram/Screens/HomeScreen/components/room_card.dart';
import 'package:telegram/Screens/HomeScreen/components/title_with_trailing_button.dart';

class NearRoomBlock extends StatelessWidget {
  const NearRoomBlock({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TitleWithTralingButton(
          title: "Public rooms near you",
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
                return RoomCard(
                  size: size,
                  url: 'https://placeimg.com/640/480/any',
                  name: "Hội anti Mai Phương tại Long Thành",
                  description:
                      "Nhóm tạo ra để mời gọi mọi người vào để anti Nguyễn Hoàng Mai Phương",
                  distance: 5.0,
                  members: 15,
                );
              }),
        )
      ],
    );
  }
}
