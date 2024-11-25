import 'package:flutter/material.dart';
import 'package:news_app_fakenews_api/controllers/trendingscreen__controller.dart';
import 'package:news_app_fakenews_api/views/NewsScreen/NewsScreen.dart';
import 'package:provider/provider.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<Trendingscreen>(context);

    if (newsProvider.trendingNews == null && !newsProvider.isLoading) {
      newsProvider.fetchTrendingNews();
    }

    return newsProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : newsProvider.trendingNews?.articles?.isEmpty ?? true
            ? Center(child: Text('No articles available'))
            : Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Featured",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    trailing: Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFFCB9DF0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsProvider.trendingNews!.articles!.length,
                      itemBuilder: (context, index) {
                        var article =
                            newsProvider.trendingNews!.articles![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(article.urlToImage ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Gradient overlay
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.transparent
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                                // Text and button overlay
                                Positioned(
                                  bottom: 30,
                                  left: 20,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? 'No Title',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 12),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFCB9DF0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigate to the NewssScreen with article details
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NewssScreen(
                                                imageUrl:
                                                    article.urlToImage ?? '',
                                                newsText: article.content ?? '',
                                                newstitle: article.title ?? '',
                                                newsName:
                                                    article.source?.name ??
                                                        'Unknown',
                                                newsDT: DateTime.parse(article
                                                    .publishedAt
                                                    .toString()),
                                                newsImage:
                                                    article.urlToImage ?? '',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Read Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
  }
}
