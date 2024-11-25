import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_fakenews_api/models/trendingModel.dart';

class Trendingscreen with ChangeNotifier {
  TrendingNews? _trendingNews;
  bool _isLoading = false;

  TrendingNews? get trendingNews => _trendingNews;
  bool get isLoading => _isLoading;

  Future<void> fetchTrendingNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=84a55a4fedb842bba0fdb2323d74cb66'),
      );

      if (response.statusCode == 200) {
        _trendingNews = TrendingNews.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
