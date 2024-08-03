// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserEntity {
  final int? id;
  // final Name name;
  final String firstName;
  final String lastName;
  final String userName;
  final String token;
  final String? image;
  UserEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.token,
    this.image,
  });
}
