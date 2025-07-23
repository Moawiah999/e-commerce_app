class UserModel {
  final String username;
  final String email;
  final String? imageUser;

  UserModel({
    required this.username,
    required this.email,
    required this.imageUser,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      imageUser: json['image_user'],
    );
  }
}
