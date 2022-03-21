import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid; // Unique ID for the user
  String name; // Name of the user
  String gender; //gender of the user
  String interestedIn; //gender you have interestedIn
  String photo; //photo of the user
  Timestamp age; // age of the user
  GeoPoint location; //location of the user

  UserModel(
      {required this.uid,
      required this.name,
      required this.gender,
      required this.interestedIn,
      required this.photo,
      required this.age,
      required this.location});
}
