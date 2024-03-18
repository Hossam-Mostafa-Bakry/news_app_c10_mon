import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';
import 'package:news_app_c10_mon/pages/home/viewModels/categoryCubit/states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(LoadingCategoryStates());

  getNewsDataSources(String categoryId) async {

    emit(LoadingCategoryStates());

    try {
      var sourcesList = await ApiManager.fetchDataSource(categoryId);
      emit(
        SuccessCategoryStates(sourcesList),
      );
    } catch (error) {
      emit(
        ErrorCategoryStates(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
