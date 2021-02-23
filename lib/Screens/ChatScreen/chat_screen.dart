import 'package:flutter/material.dart';
import 'package:telegram/components/chat_tile.dart';
import 'package:telegram/components/search_bar.dart';
import 'package:telegram/constant.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = new ScrollController();
  var friendList = ["1", "2", "3", "4", "5", "6"];
  var roomList = ["1", "2", "3", "4", "5", "6"];

  void _updateList(List items, int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }
    final element = items.removeAt(oldIndex);
    items.insert(newIndex, element);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: primaryLightColor,
            unselectedLabelColor: Colors.black.withOpacity(0.2),
            indicatorColor: primaryLightColor,
            tabs: <Tab>[
              Tab(text: "CHAT"),
              Tab(text: "ROOMS"),
            ],
          ),
          SearchBar(
            size: size,
            hintText: "Search...",
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                ReorderableListView(
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      _updateList(friendList, oldIndex, newIndex);
                    });
                  },
                  children: [
                    for (var friend in friendList)
                      ChatTile(
                        size: size,
                        key: ValueKey(friend),
                        url: 'https://placeimg.com/640/480/any',
                        name: "Nguyễn Hoàng Mai Phương",
                        message: "Hix hix " + friend,
                        timeSending: "20:18",
                      ),
                  ],
                ),
                ReorderableListView(
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      _updateList(roomList, oldIndex, newIndex);
                    });
                  },
                  children: [
                    for (var room in roomList)
                      ChatTile(
                        size: size,
                        key: ValueKey(room),
                        url: 'https://placeimg.com/640/480/any',
                        name: "Group bê đê chợ mới",
                        message: "Hehe Boizz " + room,
                        timeSending: "20:18",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
