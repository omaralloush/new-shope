// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class Name {
//   final String firstName;
//   final String maidenName;
//   final String lasttName;
//   Name({
//     required this.firstName,
//     required this.maidenName,
//     required this.lasttName,
//   });

//   // Name copyWith({
//   //   String? firstName,
//   //   String? maidenName,
//   //   String? lasttName,
//   // }) {
//   //   return Name(
//   //     firstName: firstName ?? this.firstName,
//   //     maidenName: maidenName ?? this.maidenName,
//   //     lasttName: lasttName ?? this.lasttName,
//   //   );
//   // }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'firstName': firstName,
//       'maidenName': maidenName,
//       'lasttName': lasttName,
//     };
//   }

//   factory Name.fromMap(Map<String, dynamic> map) {
//     return Name(
//       firstName: map['firstName'] as String,
//       maidenName: map['maidenName'] as String,
//       lasttName: map['lasttName'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Name.fromJson(String source) =>
//       Name.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() =>
//       'Name(firstName: $firstName, maidenName: $maidenName, lasttName: $lasttName)';

//   @override
//   bool operator ==(covariant Name other) {
//     if (identical(this, other)) return true;

//     return other.firstName == firstName &&
//         other.maidenName == maidenName &&
//         other.lasttName == lasttName;
//   }

//   @override
//   int get hashCode =>
//       firstName.hashCode ^ maidenName.hashCode ^ lasttName.hashCode;
// }
