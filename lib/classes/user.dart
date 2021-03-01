class User {
  String id;
  String name;
  String phone;
  String location;
  String numberOfLove;
  String status;
  String avatar;
  List<String> workAt;
  bool isOnline;
  List<User> friendList;

  User(
      {this.id,
      this.name,
      this.phone,
      this.location,
      this.numberOfLove,
      this.status,
      this.isOnline,
      this.avatar,
      this.friendList});

  User.copyWith({
    User baseUser,
    String id,
    String name,
    String phone,
    String location,
    String numberOfLove,
    String avatar,
    String status,
    bool isOnline,
  }) {
    this.id = id ?? baseUser.id;
    this.name = name ?? baseUser.name;
    this.phone = phone ?? baseUser.phone;
    this.location = location ?? baseUser.location;
    this.numberOfLove = numberOfLove ?? baseUser.numberOfLove;
    this.status = status ?? baseUser.status;
    this.avatar = avatar ?? baseUser.avatar;
    this.isOnline = isOnline ?? baseUser.isOnline;
    this.friendList = baseUser.friendList;
  }
}
