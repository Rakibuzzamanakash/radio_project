import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_punjab_today/Widgets/Drawer/custom_appbar.dart';

class VersionPage extends StatefulWidget {

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  AudioPlayer advancedPlayer = AudioPlayer();

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(title: 'Version', onAction: (){
        Navigator.pop(context);
    },),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
    children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("App NAme",style: TextStyle(
                    fontSize: 18
                  ),),
                  Text("Version",style: TextStyle(
                      fontSize: 18
                  ),),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(": Radio Punjab Today",style: TextStyle(
                      fontSize: 18
                  ),),
                  Text(": 0.1",style: TextStyle(
                      fontSize: 18
                  ),),
                ],

              ),
            ),
          ],
        ),
        Container(
            width: 320,
            height: 45,
            child:  Text("Developed and Designed by\nMehra Media",style: TextStyle(
                fontSize: 18
            ),),)
    ],
    ),
      ),


      bottomSheet: Container(
        height: 95.h,
        color: Colors.white,
        child: Card(
          child: ListTile(
            tileColor: Colors.white,
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  'assets/images/radio _logo.jpg',
                  width: 50.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                )),
            title: Text(
              "Radio Punjab Today",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                if (isPlaying == false) {
                  advancedPlayer.play("http://mehramedia.com:8051/;stream.mp3");
                  setState(() {
                    isPlaying = true;
                  });
                } else if (isPlaying == true) {
                  advancedPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                }
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
