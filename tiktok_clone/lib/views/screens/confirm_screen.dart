import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  final UploadVideoController _uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: VideoPlayer(controller),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: 'Song Name',
                    icon: Icons.music_note,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _captionController,
                    labelText: 'Caption',
                    icon: Icons.closed_caption,
                    isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () => _uploadVideoController.uploadVideo(
                        _songController.text,
                        _captionController.text,
                        widget.videoPath),
                    child: const Text(
                      'share',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      controller.pause();
                    },
                    child: const Text(
                      'pause',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      controller.play();
                    },
                    child: const Text(
                      'play',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
