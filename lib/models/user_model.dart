class UserModel {
  final String userName;
  final String userId;
  final String email;
  final String password;

  UserModel({
    required this.userName,
    required this.userId,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toFirebase() {
    return <String, dynamic>{
      'userName': userName,
      'userId': userId,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      userId: map['userId'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
