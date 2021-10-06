class UserModel {
  final String username;
  final String? password;
  final String fullname;
  final num age;
  final String? avatarPath;

  // # contractor
  UserModel({
    required this.username,
    this.password,
    required this.fullname,
    required this.age,
    this.avatarPath
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      age: map['age'],
      fullname: map['fullname'],
      username: map['username'],
      password: map['password'],
      avatarPath: map['avatarPath']
    );
  }
}