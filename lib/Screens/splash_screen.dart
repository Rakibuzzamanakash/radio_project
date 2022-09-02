import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),
            ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover
            ,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(color: Colors.red,),
        ),
      ),
    );
  }
}
