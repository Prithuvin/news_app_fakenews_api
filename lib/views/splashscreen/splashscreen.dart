import 'package:flutter/material.dart';
import 'package:news_app_fakenews_api/views/homescreen/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()));
      }
    });
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "asset/images/Untitled_design-removebg-preview.png",
            fit: BoxFit.fill,
          ),
        ));
  }
}
