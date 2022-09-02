import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radio_punjab_today/Widgets/Drawer/custom_appbar.dart';

class AudioPage extends StatefulWidget {
  final String link;
  const AudioPage({required this.link, Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final audioPlayer = AudioPlayer();
  //AudioPlayer advancedPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;



  final myIntAds = InterstitialAd.load(
    //adUnitId: Platform.isAndroid?'ca-app-pub-3940256099942544/1033173712':'ca-app-pub-3940256099942544/4411468910',
      adUnitId: "ca-app-pub-4591217605361158/8934585388",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ));


  final BannerAd myBanner = BannerAd(
    //adUnitId: Platform.isAndroid ? "ca-app-pub-3940256099942544/6300978111":"ca-app-pub-3940256099942544/2934735716",
    adUnitId: "ca-app-pub-4591217605361158/2022229821",
    //adUnitId: "ca-app-pub-3940256099942544/2934735716",
    size: AdSize.largeBanner,
    request: AdRequest(),
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    ),
  );
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
    myBanner.load();

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
      appBar: CoustomAppBar(title: 'Downloaded Audio', onAction: ()=>Navigator.pop(context),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 60.h,
              child: AdWidget(ad: myBanner),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 100,
                color: Colors.white10,
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
                            child: Image.network("https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
                            fit: BoxFit.cover,),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 40,
                              width: 250,
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
                  audioPlayer.play("http://mehramedia.com:8051/;stream.mp3");
                  setState(() {
                    isPlaying = true;
                  });
                } else if (isPlaying == true) {
                  audioPlayer.pause();
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
