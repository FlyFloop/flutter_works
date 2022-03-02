import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:video_compress/video_compress.dart';

import '../models/video_model.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);

    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos/').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));

    //we will put this file our database and get the url of the video
    TaskSnapshot snap = await uploadTask;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));

    //we will put this file our database and get the url of the video
    TaskSnapshot snap = await uploadTask;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  //upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid; //we need the current user uid
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(uid)
          .get(); //get the current user info

      // get video length
      var allDocs =
          await firestore.collection('videos').get(); //getting all the videos
      int length = allDocs
          .docs.length; //getting all the lenght of the all docs for the id

      String videoUrl = await _uploadVideoToStorage("Video_$length", videoPath);
      String thumbnail =
          await _uploadImageToStorage("Thumbnail_$length", videoPath);
      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $length",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
      );
      await firestore
          .collection('videos')
          .doc("Video $length")
          .set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar('Error uploading video', e.toString());
    }
  }
}
