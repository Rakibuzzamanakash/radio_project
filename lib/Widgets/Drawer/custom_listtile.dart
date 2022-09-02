import 'package:flutter/material.dart';
class CoustomListtile extends StatelessWidget {
  String image;
  String title;
  String subTitle;
  CoustomListtile({required this.image,required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 1,
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child:  ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Image.network(image),
            title: Text(title,style: TextStyle(
                fontSize: 18
            ),),
            subtitle: Text(subTitle),
          ),
        ),
      ),
    );
  }
}