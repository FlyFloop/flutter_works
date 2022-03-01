import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user_model.dart';
import 'package:tiktok_clone/views/screens/home_screen.dart';
import 'package:tiktok_clone/views/screens/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;
  late Rx<User?> _user;

  // eğer kullanıcı telefonda login yapmış ise direk anaekrana atar
  @override
  void onReady() {
    //first time app loads up
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser); //current user
    _user.bindStream(firebaseAuth
        .authStateChanges()); //binding it to a stream which is firebase listens to changes in auth state
    ever(_user, _setInitialScreen);
    /*
    user kullanıcısını şuanki kullanıcıya atıyoruz 
    ardından user kullanıcısının uygulmadan çıkıp çıkmadığını dinlemek için bindstream ile dinliyoruz
    ardından bir değişiklik olursa ever() ile sorguluyoruz
    */
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  //pick image
  void pickImage() async {
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

  //upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    return snap.ref.getDownloadURL();
  }

  //register the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save our user to the firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
        UserModel userModel = UserModel(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);
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
    } catch (e) {
      Get.snackbar('Error creating account', e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Success!', 'You have successfully logged in');
        });
      } else {
        Get.snackbar('Error creating account', 'Please fill all the fields');
      }
    } catch (e) {
      Get.snackbar('Login error', e.toString());
    }
  }
}
