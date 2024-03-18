import '../../../../models/source_model.dart';

sealed class CategoryStates {}

class LoadingCategoryStates extends CategoryStates{}
class SuccessCategoryStates extends CategoryStates{
  List<SourceModel> sourcesList;
  SuccessCategoryStates(this.sourcesList);
}
class ErrorCategoryStates extends CategoryStates{
  String? errorMessage;
  ErrorCategoryStates({this.errorMessage});
}