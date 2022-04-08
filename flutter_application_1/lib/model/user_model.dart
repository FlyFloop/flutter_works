import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String uid;
  String gender;
  String interestedIn;
  String photo;
  String age;
  GeoPoint location;
  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      required this.gender,
      required this.interestedIn,
      required this.photo,
      required this.age,
      required this.location});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'gender': gender,
      'interestedIn': interestedIn,
      'photo': photo,
      'age': age,
      'location': location
    };
  }

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var snapShotData = snapshot.data as Map<String, dynamic>;
    return UserModel(
      name: snapShotData['name'],
      email: snapShotData['email'],
      uid: snapShotData['uid'],
      gender: snapShotData['gender'],
      interestedIn: snapShotData['interestedIn'],
      photo: snapShotData['photo'],
      age: snapShotData['age'],
      location: snapShotData['location'],
    );
  }
}
