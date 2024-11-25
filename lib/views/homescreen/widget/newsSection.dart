
import 'package:flutter/material.dart';
import 'package:news_app_fakenews_api/controllers/homescreen_controller.dart';
import 'package:news_app_fakenews_api/views/NewsScreen/NewsScreen.dart';
import 'package:provider/provider.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  int? _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> newsTypes = [
      "Business",
      "Entertainment",
      "General",
      "Health",
      "Science",
      "Sports",
      "Technology"
    ];

    return NewsSectionn(newsTypes, context);
  }

  Column NewsSectionn(List<String> newsTypes, BuildContext context) {
    return Column(
    children: [
      // Section Title
      ListTile(
        leading: Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        trailing: Text(
          "See all",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFFD4BEE4),
          ),
        ),
      ),
   
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: List.generate(
              newsTypes.length,
              (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () async {
               
                    print("Selected: ${newsTypes[index]}");
                    setState(() {
                      _selectedCategoryIndex =
                          index; 
                    });

                    final category = newsTypes[index];
                    context.read<HomescreenController>().fetchNews(category);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _selectedCategoryIndex == index
                          ? Color(0xFFD4BEE4) 
                          : Colors.white, 
                      border: Border.all(
                        width: 2,
                        color: _selectedCategoryIndex == index
                            ? Color(
                                0xFFCB9DF0) 
                            : Color(0xFFCB9DF0),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      newsTypes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: _selectedCategoryIndex == index
                            ? Colors.white 
                            : Color(0xFFCB9DF0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
     
      Consumer<HomescreenController>(
        builder: (context, ProObj, child) {
          final articles = ProObj.businessNews?.articles;

          if (ProObj.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (ProObj.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${ProObj.errorMessage}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (articles == null || articles.isEmpty) {
            return Center(
              child: Text(
                'No news available.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }

          return ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true, 
            physics:
                NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final article = articles[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewssScreen(
                          imageUrl: article.urlToImage ??
                              "https://via.placeholder.com/150", 
                          newsText:
                              article.content ?? "No content available.",
                          newstitle: article.title ?? "No title available",
                          newsName: article.source?.name ?? "NAN",
                          newsDT: DateTime.now(),
                          newsImage:
                              'https://images.pexels.com/photos/159652/table-food-book-newspaper-159652.jpeg?auto=compress&cs=tinysrgb&w=400',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    child: Stack(
                      children: [
                        // News Image
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFCB9DF0),
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  article.urlToImage ??
                                      "https://via.placeholder.com/150",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 2.8,
                            height: 150,
                          ),
                        ),
                        // News Title
                        Positioned(
                          top: 10,
                          right: 10,
                          left: 150,
                          child: Text(
                            article.title ?? "No title available",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Source Information
                        Positioned(
                          top: 75,
                          right: 100,
                          left: 150,
                          child: Text(
                            article.source?.name ?? "Unknown Source",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    ],
  );
  }
}
