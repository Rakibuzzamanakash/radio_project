import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Api Call/Get_Video_Category/get_video_category_data.dart';
import '../../../Api Call/Model/Categories_Model/Video/video_categories_model.dart';
import '../../../Widgets/Drawer/custom_appbar.dart';
import '../../../Widgets/Drawer/custom_listtile.dart';
// import '../../../Widgets/Custom_AppBar/custom_appbar.dart';
// import '../../../Widgets/Custom_ListTile/custom_listtile.dart';

class VideoCategoryScreen extends StatefulWidget {
  const VideoCategoryScreen({Key? key}) : super(key: key);

  @override
  State<VideoCategoryScreen> createState() => _VideoCategoryScreenState();
}

class _VideoCategoryScreenState extends State<VideoCategoryScreen> {

  @override
  void initState() {
    super.initState();
    final VideoCategoryModel =Provider.of<VideoCategoryDataClass>(context, listen: false);
   VideoCategoryModel.getVideoCategoryData();
  }



  Future _launchURLApp() async {
    var url = Uri.parse("https://www.youtube.com/c/RadioPunjabtoday/videos");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    final videoCategoryModel = Provider.of<VideoCategoryDataClass>(context);
    return  Scaffold(
        appBar: CoustomAppBar(
          title: "Category",
          onAction: () {
            Navigator.pop(context);
          },
        ),
        body:videoCategoryModel.loading
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoCategoryModel.videos!.categories!.length,
          itemBuilder: (context, index) {
              return Column(
                children: [
                  // Container(
                  //   height: 60.h,
                  //   child: AdWidget(ad: myBanner),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: InkWell(
                      onTap: (){
                        _launchURLApp();
                      },
                      child: Card(
                        elevation: 1,
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            minLeadingWidth: 80,
                            leading: Container(
                                height: 80,
                                width: 80,
                                child: Image.network(
                                  videoCategoryModel.videos!
                                      .categories![index].imgPath!,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              videoCategoryModel
                                  .videos!.categories![index].name!,
                              style: TextStyle(fontSize: 15),
                            ),
                            subtitle: Text(videoCategoryModel
                                .videos!.categories![index].videoCount
                                .toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
          },
        ),
            ));
  }
}
