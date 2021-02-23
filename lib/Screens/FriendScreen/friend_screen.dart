import 'package:flutter/material.dart';
import 'package:telegram/components/circle_image.dart';
import 'package:telegram/components/search_bar.dart';

import '../../constant.dart';
import 'components/friend_tile.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
              labelColor: primaryLightColor,
              unselectedLabelColor: Colors.black.withOpacity(0.2),
              indicatorColor: primaryLightColor,
              tabs: <Tab>[
                Tab(text: "FRIENDS"),
                Tab(text: "FRIEND REQUESTS"),
              ]),
          SearchBar(
            size: size,
            hintText: "Search...",
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      if (index.isEven)
                        return FriendTile(
                          size: size,
                          name: 'Hoàng Trọng Dũng',
                          url: 'https://placeimg.com/640/480/any',
                        );
                      else
                        return Divider();
                    }),
                ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      if (index.isEven)
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          key: ValueKey(index),
                          onDismissed: (direction) {},
                          child: ListTile(
                            leading: CircleImage(
                              size: size.width * 0.15,
                              url: 'https://placeimg.com/640/480/any',
                            ),
                            title: Text("HEHE BOIZZZ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(
                              "I'm sorry, don't leave me, I want you here with me, I know that your love is gone, I can't breathe, I'm so weak, I know this isn't easy",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.check),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      else
                        return Divider();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
