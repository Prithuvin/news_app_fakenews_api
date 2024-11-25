import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewssScreen extends StatelessWidget {
  final String imageUrl;
  final String newsText;
  final String newstitle;
  final String newsName;
  final DateTime newsDT;
  final String newsImage;

  
  const NewssScreen({
    Key? key,
    required this.imageUrl,
    required this.newsText,
    required this.newstitle,
    required this.newsName,
    required this.newsDT,
    required this.newsImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format DateTime
    String formatDateTime(DateTime newsDT) {
      return DateFormat('yyyy-MM-dd HH:mm').format(newsDT); // Example format
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD4BEE4).withOpacity(0.2),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.share,
                  color: Color(0xFFD9B7EBD),
                  size: 20,
                ),
                onPressed: () {
                  // Add share functionality here
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD4BEE4).withOpacity(0.2),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_outlined,
                  color: Color(0xFFD9B7EBD),
                  size: 20,
                ),
                onPressed: () {
                  // Add bookmark functionality here
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 20),
            child: Container(
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
                  // Add more options functionality here
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    // '11:29 12/2/2009'
                    formatDateTime(newsDT),

                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Display News Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                newstitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87, fontWeight: FontWeight.w800,
                  height: 1.5, // Adjust line height for better readability
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(newsImage),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    newsName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors
                          .black87, // Adjust line height for better readability
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD4BEE4),
                    ),
                    child: Align(
                        alignment: Alignment.center, child: Text("Follow")),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // Display News Text
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                newsText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5, // Adjust line height for better readability
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
