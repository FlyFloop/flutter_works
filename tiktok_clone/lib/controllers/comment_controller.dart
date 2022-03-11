import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/comment_model.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;
  String _postId = "";
  updatePostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {
    _comments.bindStream(
      firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .snapshots()
          .map((QuerySnapshot querySnapshot) {
        List<Comment> returnList = [];
        for (var element in querySnapshot.docs) {
          returnList.add(Comment.fromSnap(element));
        }
        return returnList;
      }),
    );
  }

  postComment(String commenText) async {
    try {
      if (commenText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection('users')
            .doc(authController.user.uid)
            .get();
        var allDocs = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();
        int length = allDocs.docs.length;

        Comment comment = Comment(
            userName: (userDoc.data()! as Map<String, dynamic>)['name'],
            comment: commenText,
            likes: [],
            profilePhoto:
                (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
            uid: authController.user.uid,
            id: 'Comment $length',
            datePublished: DateTime.now());

        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('Comment $length')
            .set(comment.toJson());
        DocumentSnapshot doc =
            await firestore.collection('videos').doc(_postId).get();
        firestore.collection('videos').doc(_postId).update({
          'commentCount':
              (doc.data()! as Map<String, dynamic>)['commentCount'] + 1
        });
      }
    } catch (e) {
      Get.snackbar('Error while commenting', e.toString());
    }
  }

  likeComment(String id) async {
    var uid = authController.user.uid;
    DocumentSnapshot doc = await firestore
        .collection('videos')
        .doc(_postId)
        .collection('comments')
        .doc(id)
        .get();
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }
}
