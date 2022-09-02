import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AudioPage extends StatefulWidget {
  final String link;
  const AudioPage({required this.link, Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        // isPlaying = state = PlayerState.PLAYING;
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              child: Container(
                height: 100,
                color: Colors.red,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.amber,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 40,
                              width: 250,
                              color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "jhghgskglsjjppe kphkkhtkhkrtph  kprtkhprktphkrptkhprtkhpkrtphkptgjlgj",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    "jhghgskglsjjppe kphkkhtkhkrtph  kprtkhprktphkrptkhprtkhpkrtphkptgjlgj",
                                    style: TextStyle(
                                        fontSize: 13.5,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 30,
                                color: Colors.amber,
                                child: IconButton(
                                  onPressed: () async {
                                    audioPlayer.setUrl(widget.link);
                                    if (isPlaying) {
                                      await audioPlayer.pause();
                                    } else {
                                      await audioPlayer.resume();
                                    }
                                  },
                                  icon: Icon(isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                                  color: Colors.red,
                                  iconSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 40,
                                  width: 15,
                                  color: Colors.blueGrey,
                                  child: Icon(Icons.more_vert),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${position.inMinutes.floorToDouble()}'),
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position =
                                Duration(seconds: value.toInt());
                                await audioPlayer.seek(position);

                                await audioPlayer.resume();
                              },
                            ),
                          ),
                          Text(
                              "${duration.inMinutes.floorToDouble() - position.inMinutes.floorToDouble()}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
