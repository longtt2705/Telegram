import 'package:telegram/classes/friend_request.dart';
import 'package:telegram/classes/message_box.dart';
import 'package:telegram/classes/notification_news.dart';
import 'package:telegram/classes/user.dart';

class AppState {
  User currentUser;
  List<MessageBox> userMessages;
  List<MessageBox> roomMessages;
  List<FriendRequest> friendRequests;
  List<NotificationNews> notifications;

  AppState(
      {this.currentUser,
      this.userMessages,
      this.roomMessages,
      this.friendRequests,
      this.notifications});

  AppState.copyWith(
      {AppState prevState,
      User currentUser,
      List<MessageBox> userMessages,
      List<MessageBox> roomMessages,
      List<FriendRequest> friendRequests,
      List<NotificationNews> notifications}) {
    this.currentUser = currentUser ?? prevState.currentUser;
    this.userMessages = userMessages ?? prevState.userMessages;
    this.roomMessages = userMessages ?? prevState.roomMessages;
    this.friendRequests = friendRequests ?? prevState.friendRequests;
    this.notifications = notifications ?? prevState.notifications;
  }

  AppState.initial() {
    currentUser =
        userMessages = roomMessages = friendRequests = notifications = null;
  }
}
