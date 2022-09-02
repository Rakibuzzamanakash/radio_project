import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/Social_link_view/website_view_screen.dart';
import '../Widgets/Drawer/custom_appbar.dart';
import '../Widgets/Drawer/custom_listtile.dart';

class ViewAllSocial extends StatefulWidget {

  @override
  State<ViewAllSocial> createState() => _ViewAllSocialState();
}

class _ViewAllSocialState extends State<ViewAllSocial> {


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
    adUnitId: Platform.isAndroid ? "ca-app-pub-3940256099942544/6300978111":"ca-app-pub-3940256099942544/2934735716",
    // adUnitId: "ca-app-pub-4591217605361158/2022229821",
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
  Future _launchURLApp() async {
    var url = Uri.parse("https://youtube.com/c/RadioPunjabtoday");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(title: "Social", onAction: (){
        Navigator.pop(context);
      }),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 60.h,
            child: AdWidget(ad: myBanner),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => WebSiteView(
                    link: "https://radiopunjabtoday.com/",
                    appBarTitle: "Website",
                  )));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/images.jfif",
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Website",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => WebSiteView(
                    link: "https://m.facebook.com/radiopunjabtoday/",
                    appBarTitle: "facebook",
                  )));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Facebook-Icon-Large.png",
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "FaceBook",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (builder) => WebSiteView(
            //             link: "https://youtube.com/c/RadioPunjabtoday",
            //             appBarTitle: "Youtube",
            //           )));
            // },
            onTap: _launchURLApp,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/YouTube.png",
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "YouTube",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final toEmail = "info@radiopunjabtoday.com";
              final subject = 'Great Radio';
              final message = 'Hello! Radio Punjab';
              final url =
                  "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}";

              await launch(url);
              // _launchEmail();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/email_logo.png",
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Email Us",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}