import 'package:flutter/material.dart';
import 'package:news_app_fakenews_api/controllers/homescreen_controller.dart';
import 'package:news_app_fakenews_api/controllers/trendingscreen__controller.dart';
import 'package:news_app_fakenews_api/views/categoryscreen/categoryscreen.dart';

import 'package:news_app_fakenews_api/views/homescreen/bookmarkScreen/bookmarkScreen.dart';
import 'package:news_app_fakenews_api/views/homescreen/widget/featuredsection.dart';
import 'package:news_app_fakenews_api/views/homescreen/widget/newsSection.dart';
import 'package:news_app_fakenews_api/views/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePagescreen(), // Home
    Categoryscreen(), // Categories
    Bookmarkscreen(), // Bookmark
    ProfilePage() // Profile
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomescreenController>().fetchNews('business');
      context.read<Trendingscreen>().fetchTrendingNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomePagescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  "asset/images/newslogoo.png",
                ),
              ),
              title: Text(
                "Global News",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD4BEE4),
                ),
                child: Icon(
                  Icons.notifications,
                  size: 15,
                ),
              ),
            ),
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
          SizedBox(height: 20),
          FeaturedSection(),
          SizedBox(height: 20),
          NewsSection(),
        ],
      ),
    );
  }
}
