import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//FIREBASE
var firebaseAuth = FirebaseAuth
    .instance; //böylelikle firebaseAuth'i sürekli FirebaseAuth.instance  yazmadankullanabiliriz.
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//CONTROLLER
var authController = AuthController.instance;

const pages = [
  Text('Home Screen'),
  Text('Search Screen'),
  Text('Add page Screen'),
  Text('Message Screen'),
  Text('Profile Screen'),
];
