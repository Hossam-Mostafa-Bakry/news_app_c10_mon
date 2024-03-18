import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/models/source_model.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';

class CategoryViewModel extends ChangeNotifier {

  List<SourceModel> _sourcesList = [];

  List<SourceModel> get sourcesList => _sourcesList;


  getNewsDataSource(String categoryId) async {
    try {
      // sourcesList scope
       _sourcesList =
          await ApiManager.fetchDataSource(categoryId);

       notifyListeners();
    } catch (e) {

      print(
        e.toString(),
      );

    }
  }

}
