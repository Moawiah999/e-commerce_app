class UserModel {
  final String username;
  final String email;
  final String? imageUser;
  final int user_id;

  UserModel({
    required this.username,
    required this.email,
    required this.imageUser,
    required this.user_id,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      imageUser: json['image_user'],
      user_id: json['id'],
    );
  }
}
