import 'package:flutter/material.dart';
import 'package:news_app_fakenews_api/views/homescreen/homescreen.dart';

class Bookmarkscreen extends StatefulWidget {
  const Bookmarkscreen({super.key});

  @override
  State<Bookmarkscreen> createState() => _BookmarkscreenState();
}

class _BookmarkscreenState extends State<Bookmarkscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("asset/images/newslogoo.png"),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("My Bookmarks"),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD4BEE4).withOpacity(0.2),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Color(0xFFD9B7EBD),
                        size: 20,
                      ),
                      onPressed: () {
                        // Add share functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD4BEE4),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

// adds the bookmarked section that


            ///
            /////
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///if the bookmark not presented then it will show this message
            ///
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "asset/images/Untitled_design__1_-removebg-preview.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Text(
                    "No Bookmarked news added",
                    style: TextStyle(fontSize: 14, color: Color(0xFFD4BEE4)),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD4BEE4)),
                  child: Align(
                      alignment: Alignment.center, child: Text("Add Bookmark")),
                ),
              ),
            )
          ],
        ));
  }
}
