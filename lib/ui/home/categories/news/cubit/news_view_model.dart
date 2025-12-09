import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/categories/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsLoadingState());

  void getNews(String sourceId) async {

    try {
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response!.status == "ok") {
        emit(NewsSuccessState(newsList: response.articles!));
        return;
      } else if (response.status == "error") {
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
