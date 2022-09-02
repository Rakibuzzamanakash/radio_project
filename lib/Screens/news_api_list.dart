import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_punjab_today/utils/colors.dart';

import '../../Api Call/Get_News_Data/get_data.dart';
import 'News_Screens/news_detail_screen.dart';




class NewsApiLisrt extends StatefulWidget {
  const NewsApiLisrt({Key? key}) : super(key: key);

  @override
  State<NewsApiLisrt> createState() => _NewsApiLisrtState();
}

class _NewsApiLisrtState extends State<NewsApiLisrt> {
  @override
  void initState() {
    super.initState();
    final newsModel = Provider.of<NewsDataClass>(context, listen: false);
    newsModel.getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = Provider.of<NewsDataClass>(context);
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
    "News",
    style: TextStyle(
    fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
    ),
    ),
    body: newsModel.loading
    ? Container(
    child: Center(child:CircularProgressIndicator(),),
    )
        : ListView.builder(
    itemCount: newsModel.post!.items!.length,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:5),
    child: Container(
    height: 90,
    decoration:BoxDecoration(
    borderRadius:BorderRadius.circular(15),
    color:Colors.white
    ),
    child: GestureDetector(
    onTap: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (builder) => NewsDetailScreen(
    dataDate:"",
    dateTime: newsModel
        .post!.items![index].datePublished!,
    titleText:
    newsModel.post!.items![index].title!,
    imgUrl:
    newsModel.post!.items![index].image!,
    bodyText: newsModel
        .post!.items![index].contentText!,)));
    },
    child: Row(children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
    height: 90,
    width: 130,
    child: Image.network(
    newsModel.post!.items![index].image!,
    fit: BoxFit.cover,
    ),
    ),
    ),
    SizedBox(
    height:10,
    ),
    Expanded(child:Column(
    mainAxisAlignment:MainAxisAlignment.spaceAround,
    children: [
    Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
    newsModel
        .post!.items![index].title!,
    style:
    TextStyle(fontSize: 13, color: Colors.black),
    ),
    ),
    Container(
    child: SingleChildScrollView(
    scrollDirection:Axis.horizontal,
    child: Text(
    newsModel
        .post!.items![index].datePublished!,
    style:
    TextStyle(fontSize: 12, color: Colors.red[600]),
    ),
    ),
    ),],
    ))



    ]),
    ),
    ));
    }),
      bottomSheet: Container(
        height: 100,
        color: Colors.white,
        child: Card(
          child: ListTile(
            tileColor: Colors.white,
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/radio _logo.jpg',
                  width: 50,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            title: Text(
              "Radio Punjab Today",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(
              Icons.pause,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}