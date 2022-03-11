import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({Key? key, required this.id}) : super(key: key);
  final TextEditingController _commenTextController = TextEditingController();
  final CommentController _commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _commentController.updatePostId(id);
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: _commentController.comments.length,
                    itemBuilder: ((context, index) {
                      final comment = _commentController.comments[index];
                      return ListTile(
                        trailing: InkWell(
                            onTap: () =>
                                _commentController.likeComment(comment.id),
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: comment.likes
                                      .contains(authController.user.uid)
                                  ? Colors.red
                                  : Colors.white,
                            )),
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          children: [
                            Text(
                              '${comment.userName} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                  fontSize: 20),
                            ),
                            Text(
                              comment.comment,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        subtitle: Row(children: [
                          Text(
                            tago.format(comment.datePublished.toDate()),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${comment.likes.length} likes',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ]),
                      );
                    }));
              }),
            ),
            const Divider(),
            ListTile(
              title: TextFormField(
                controller: _commenTextController,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              trailing: TextButton(
                  onPressed: () => _commentController
                      .postComment(_commenTextController.text),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
