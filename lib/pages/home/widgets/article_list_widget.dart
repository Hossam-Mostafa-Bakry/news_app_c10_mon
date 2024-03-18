import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/pages/home/viewModels/articlesCubit/cubit.dart';
import 'package:news_app_c10_mon/pages/home/viewModels/articlesCubit/states.dart';
import 'package:news_app_c10_mon/pages/home/widgets/article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesStates>(
      builder: (context, state) {
        switch (state) {
          case LoadingArticlesStates():
            {
              return Center(
                child: CircularProgressIndicator(
                  color: Constants.theme.primaryColor,
                ),
              );
            }
          case ErrorArticlesStates():
            {
              return Center(
                child: Text(
                  state.errorMessage ?? "",
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              );
            }
          case SuccessArticlesStates():
            {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItemWidget(
                      articleModel: state.articlesList[index]),
                  itemCount: state.articlesList.length,
                ),
              );
            }
        }
      },
    );
    /* FutureBuilder(
      future: ApiManager.fetchDataArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error fetching articles",
              style: Constants.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Constants.theme.primaryColor,
            ),
          );
        }

        List<ArticleModel> articlesList = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(articleModel: articlesList[index]),
            itemCount: articlesList.length,
          ),
        );
      },
    );*/
  }
}
