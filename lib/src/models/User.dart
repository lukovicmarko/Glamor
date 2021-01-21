class User {
  final String id;
  final String name;
  final String email;
  final String image;

  User({this.id, this.name, this.email, this.image});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "image": image,
    };
  }
}
