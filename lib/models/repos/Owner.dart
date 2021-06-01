class Owner {
  final int id;

  final String login;

  final String avatar;

  Owner({required this.id, required this.login, required this.avatar});

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      id: map["id"],
      login: map["login"],
      avatar: map["avatar_url"],
    );
  }
}
