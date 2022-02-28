import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String profilePhoto;
  String email;
  String uid;
  UserModel(
      {required this.name,
      required this.profilePhoto,
      required this.email,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid
    };
  }

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var snapShotData = snapshot.data as Map<String, dynamic>;
    return UserModel(
        name: snapShotData['name'],
        profilePhoto: snapShotData['profilePhoto'],
        email: snapShotData['email'],
        uid: snapShotData['uid']);
  }
}
