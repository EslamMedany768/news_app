import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/categories/categories/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceState> {
  SourceViewModel() : super(SourceLoadingState());

  void getSourcesCategories(String category) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(category);
      if (response!.status == "error") {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      } else if (response.status == "ok") {
        emit(SourceSuccessState(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
