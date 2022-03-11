import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import 'package:tiktok_clone/constants.dart';
import 'package:video_compress/video_compress.dart';

import '../models/video_model.dart';

class UploadVideoController extends GetxController {
  _getThumbnail(String videoPath) async {
    final videoThumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return videoThumbnail;
  }

  //upload video thumbnail
  Future<String> _uploadThumbnailToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    //upload video thumbnail to firebase storage
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //compress the video
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.DefaultQuality);
    return compressedVideo!.file;
  }

  //upload video to storage
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    //get the download url
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String currentUid = firebaseAuth.currentUser!.uid; //current user id
      DocumentSnapshot userDocs = await firestore
          .collection('users')
          .doc(currentUid)
          .get(); //all of that stuff is just to get the user' info
      //get the video id
      var allVideoDocs = await firestore.collection('videos').get();
      var videoLength = allVideoDocs.docs.length;
      String videourl =
          await _uploadVideoToStorage(videoLength.toString(), videoPath);
      String videoThumbnail =
          await _uploadThumbnailToStorage(videoLength.toString(), videoPath);
      Video video = Video(
          userName: (userDocs.data()! as Map<String, dynamic>)['name'],
          uid: currentUid,
          id: 'Video $videoLength',
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videourl,
          thumbnail: videoThumbnail,
          profilePhoto:
              (userDocs.data()! as Map<String, dynamic>)['profilePhoto']);
      await firestore.collection('videos').doc(video.id).set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar('Uplaod Video Error', e.toString());
    }
  }
}
