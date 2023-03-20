// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String uid;
  String? firstname;
  String? lastname;
  String? address;
  String? profileImage;
  UserModel({
    required this.uid,
    this.firstname,
    this.lastname,
    this.address,
    this.profileImage,
  });

  UserModel copyWith({
    String? uid,
    String? firstname,
    String? lastname,
    String? address,
    String? profileImage,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, firstname: $firstname, lastname: $lastname, address: $address, profileImage: $profileImage)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.address == address &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        address.hashCode ^
        profileImage.hashCode;
  }
}
