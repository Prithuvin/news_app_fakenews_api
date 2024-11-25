import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_fakenews_api/models/homescreen_model.dart';
import 'dart:convert';

class HomescreenController with ChangeNotifier {
  BusinessNews? _businessNews;
  bool _isLoading = false;
  String _errorMessage = '';
   

  BusinessNews? get businessNews => _businessNews;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNews(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=84a55a4fedb842bba0fdb2323d74cb66');

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
     
      final response = await http.get(url);
      log('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log('API response: $data'); 

        _businessNews = BusinessNews.fromJson(data);
        log('Parsed BusinessNews: $_businessNews'); 

        if (_businessNews == null || data['articles'] == null) {
          _errorMessage = 'Unexpected data format';
          log(_errorMessage);
        } else {
          log('Successfully fetched ${data['articles'].length} articles.');
        }
      } else {
        _errorMessage =
            'Failed to load news: ${response.reasonPhrase} (Code: ${response.statusCode})';
        log(_errorMessage);
      }
    } catch (e, stackTrace) {
      _errorMessage = 'Error occurred: $e';
      log('Error fetching news: $e', stackTrace: stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
