import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_punjab_today/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCategory extends StatefulWidget {
  final String youtubeUrl, titleTex;
  const VideoCategory(
      {required this.youtubeUrl, required this.titleTex, Key? key})
      : super(key: key);

  @override
  State<VideoCategory> createState() => _VideoCategoryState();
}

class _VideoCategoryState extends State<VideoCategory> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.youtubeUrl.toString())!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          isLive: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appRedColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            "Radio Punjab Today",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.titleTex,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 60.w,
            ),
          ],
        ));
  }
}
