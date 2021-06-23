class User {
  final String? type;
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? postcode;
  final String? activity;
  final String? age;
  final String? genre;
  final String? language;

  User({
    this.type,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.postcode,
    this.activity,
    this.age,
    this.genre,
    this.language,
  });

  factory User.fromJson(data) {
    return User(
      type: data["type"],
      username: data["username"],
      firstname: data["firstname"],
      lastname: data["lastname"],
      email: data["email"],
      postcode: data["postcode"],
      activity: data["activity"],
      age: data["age"],
      genre: data["genre"],
      language: data["language"],
    );
  }
}
