import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';

import '../../../models/article_model.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<ArticleModel> _articlesList = [];

  List<ArticleModel> get articlesList => _articlesList;

  getNewsArticles(String sourceId) async {
    try {
      _articlesList = await ApiManager.fetchDataArticles(sourceId);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
