import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller_consts.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  static SignupController instance = Get.find();
  late Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;
  late Rx<User?> _user;
  User get user => _user.value!;
  //upload to firebase storage and get link photo
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    return snap.ref.getDownloadURL();
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.snackbar(
        'Profile picture',
        'Image selected',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 10,
      );
    }
    _pickedImage = Rx<File?>(File(image!.path));
  }

//signup user
  Future<void> signupUser(
      String name,
      String email,
      String password,
      String age,
      File? photo,
      String userGender,
      String userLookingFor,
      GeoPoint location) async {
    try {
      if (name.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          photo != null &&
          userGender.isNotEmpty &&
          userLookingFor.isNotEmpty &&
          age.isNotEmpty) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(photo);
        UserModel userModel = UserModel(
            name: name,
            email: email,
            uid: cred.user!.uid,
            gender: userGender,
            interestedIn: userLookingFor,
            photo: downloadUrl,
            age: age,
            location: location);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userModel.toJson())
            .then((value) {
          Get.snackbar('Success!', 'You have successfully registered');
        });
      } else {
        Get.snackbar('Error creating account', 'Please fill all the fields');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error while registering app', e.toString());
    }
  }
}
