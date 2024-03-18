import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';
import 'package:news_app_c10_mon/pages/home/viewModels/articlesCubit/states.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(LoadingArticlesStates());

  getNewsArticles(String sourceId) async {
    emit(LoadingArticlesStates());

    try {
      var articles = await ApiManager.fetchDataArticles(sourceId);
      emit(
        SuccessArticlesStates(articles),
      );
    } catch (error) {
      emit(
        ErrorArticlesStates(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
