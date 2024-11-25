import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewssScreen extends StatefulWidget {
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
  _NewssScreenState createState() => _NewssScreenState();
}

class _NewssScreenState extends State<NewssScreen> {
  bool isFollowing = false;

  // Format DateTime
  String formatDateTime(DateTime newsDT) {
    return DateFormat('yyyy-MM-dd HH:mm').format(newsDT); // Example format
  }

  @override
  Widget build(BuildContext context) {
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
                  // Add share 
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
                  Icons.bookmark_outline,
                  color: Color(0xFFD9B7EBD),
                  size: 20,
                ),
                onPressed: () {
                  // Add bookmark 
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
                    image: NetworkImage(widget.imageUrl),
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
                    formatDateTime(widget.newsDT),
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
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.newstitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  height: 1.5, 
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
                    backgroundImage: NetworkImage(widget.newsImage),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.newsName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors
                          .black87, // Adjust line height for better readability
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFollowing = !isFollowing; 
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isFollowing ? Colors.white : Color(0xFFD4BEE4),
                        border: Border.all(
                          color: isFollowing
                              ? Colors.transparent
                              : Colors.grey, 
                          //  Color(0xFFD4BEE4),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          isFollowing ? "Following" : "Follow",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isFollowing ? Colors.black : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                widget.newsText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
