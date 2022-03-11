import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black12,
                leading: const Icon(Icons.person_add_alt_1_outlined),
                actions: const [Icon(Icons.more_horiz)],
                title: Text(
                  '${controller.user['name']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              '${controller.user['profilePhoto']}'),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${controller.user['following']}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Following',
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              '${controller.user['followers']}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Followers',
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              '${controller.user['likes']}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Likes',
                              style: const TextStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 140,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              if (widget.uid == authController.user.uid) {
                                authController.signOut();
                              } else {
                                controller.followUser();
                              }
                            },
                            child: Text(
                                widget.uid == authController.user.uid
                                    ? 'Sign Out'
                                    : controller.user['isFollowing']
                                        ? 'Unfollow'
                                        : 'Follow',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    //video list
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.user['thumbnails'].length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          String thumbnail =
                              controller.user['thumbnails'][index];
                          return CachedNetworkImage(
                              imageUrl: thumbnail, fit: BoxFit.cover);
                        })
                  ],
                ),
              ));
        });
  }
}
