import 'package:flutter/material.dart';

import 'package:news_app_fakenews_api/controllers/homescreen_controller.dart';
import 'package:news_app_fakenews_api/controllers/trendingscreen__controller.dart';

import 'package:news_app_fakenews_api/views/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Trendingscreen(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
