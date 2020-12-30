class User {
  final String id;
  final String name;
  final String email;

  User({this.id, this.name, this.email});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }
}
