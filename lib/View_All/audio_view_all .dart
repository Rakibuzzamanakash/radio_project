import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../Screens/View_All_Screen/Audio_Screens/audio_categories_screen.dart';
import '../Screens/View_All_Screen/Audio_Screens/single_parson_audio.dart';
import '../Widgets/Drawer/custom_appbar.dart';
import '../Widgets/Drawer/custom_listtile.dart';

class ViewAllAudio extends StatefulWidget {

  @override
  State<ViewAllAudio> createState() => _ViewAllAudioState();
}

class _ViewAllAudioState extends State<ViewAllAudio> {


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
    super.initState();
    myBanner.load();
    myIntAds;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(title: "Category", onAction: (){
        Navigator.pop(context);
      }),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 60.h,
            child: AdWidget(ad: myBanner),
          ),
          AudioCategoryScreen(),
        ],
      ),
    );
  }
}