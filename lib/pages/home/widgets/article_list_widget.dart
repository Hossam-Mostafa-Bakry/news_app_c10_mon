import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/pages/home/viewModel/articles_view_model.dart';
import 'package:news_app_c10_mon/pages/home/widgets/article_item_widget.dart';
import 'package:provider/provider.dart';

class ArticleListWidget extends StatefulWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesViewModel>(
      builder: (context, vm, _) {
        if (vm.articlesList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Constants.theme.primaryColor,
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(articleModel: vm.articlesList[index]),
            itemCount: vm.articlesList.length,
          ),
        );
      },
    );
    // return FutureBuilder(
    //   future: ApiManager.fetchDataArticles(sourceId),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text(
    //           "Error fetching articles",
    //           style: Constants.theme.textTheme.bodyLarge?.copyWith(
    //             color: Colors.black,
    //           ),
    //         ),
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Constants.theme.primaryColor,
    //         ),
    //       );
    //     }
    //
    //     List<ArticleModel> articlesList = snapshot.data ?? [];
    //
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) =>
    //             ArticleItemWidget(articleModel: articlesList[index]),
    //         itemCount: articlesList.length,
    //       ),
    //     );
    //   },
    // );
  }
}
