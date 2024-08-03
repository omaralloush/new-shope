import '../../entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {super.id,
      required super.firstName,
      required super.lastName,
      required super.userName,
      required super.token,
      super.image});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'username': userName,
      'password': token,
      'image': image ?? '',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userName: map['username'] as String,
      token: map['token'] as String,
      image: map['image'] ?? '',
    );
  }
  @override
  String toString() {
    return toMap().toString();
  }
}
