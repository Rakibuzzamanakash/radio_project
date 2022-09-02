import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:launch_review/launch_review.dart';
import 'package:radio_punjab_today/Screens/Drawer_screen/download_audio.dart';
import 'package:radio_punjab_today/Screens/Drawer_screen/version_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Widgets/Drawer/navigation_container.dart';
import '../../utils/colors.dart';
import '../Social_link_view/website_view_screen.dart';
import '../home_page.dart';
import 'privacy_policy_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 105.h,
            width: double.maxFinite,
            color: AppColors.appRedColor,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: Text(
                  "Radio Punjab Today",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => HomePage()));
                },
                child: NavigationContainer(
                  titleText: "Home",
                  icon: Icons.home_filled,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        alignment: Alignment.center,
                        backgroundColor: Colors.white,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 20),
                          child: Text(
                            "921-641-0666",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        content: Container(
                          height: 60,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "CANCEL",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red[800],
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final phoneNum = "+112345678";
                                        final url = "tel:${phoneNum}";
                                        if (await canLaunch(url)) {
                                          await launch(
                                            url,
                                          );
                                        }
                                      },
                                      child: Text(
                                        "CALL",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red[800],
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        titlePadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                      ));
                },
                child: NavigationContainer(
                  titleText: "Call Studio",
                  icon: Icons.call_rounded,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>AudioPage(link: '',)));
                },
                child: NavigationContainer(
                  titleText: "Download Audio",
                  icon: Icons.download,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => WebSiteView(
                        link: "https://radiopunjabtoday.com/?page_id=497",
                        appBarTitle: "Our Team",
                      )));
                },
                child: NavigationContainer(
                  titleText: "Our Team",
                  icon: Icons.supervised_user_circle_rounded,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => WebSiteView(
                        link: "https://radiopunjabtoday.com/mobile-privacy-policy-radioPunjabtoday.html",
                        appBarTitle: "Privacy Policy",
                      )));
                },
                child: NavigationContainer(
                  titleText: "Privacy Policy",
                  icon: Icons.privacy_tip,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => WebSiteView(
                        link: "https://radiopunjabtoday.com/mobile-privacy-policy-radioPunjabtoday.html",
                        appBarTitle: "Privacy Policy",
                      )));
                },
                child: NavigationContainer(
                  titleText: "Terms & Conditions",
                  icon: Icons.file_copy_outlined,
                ),
              ),
              InkWell(
                onTap: (){
                  LaunchReview.launch(
                    androidAppId: "com.example.punjab",
                    iOSAppId: "375380948",
                    writeReview: false,
                    isiOSBeta: true,
                  );
                },
                child: NavigationContainer(
                  titleText: "Rate This App!",
                  icon: Icons.star_rate_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 43.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.red[600],
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VersionPage()));
                                  },
                                  child: Text(
                                    "Version",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Text(
                              "0.1",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
