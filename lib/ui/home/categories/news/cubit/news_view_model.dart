import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/categories/news/cubit/news_states.dart';

import '../../../../../repository/news/dataSources/news_remote_data_source.dart';
import '../../../../../repository/news/dataSources/news_remote_data_source_impl.dart';
import '../../../../../repository/news/repository/news_repository.dart';
import '../../../../../repository/news/repository/news_repository_impl.dart';

class NewsViewModel extends Cubit<NewsState> {
  late NewsRepository newsRepository;
  late NewsRemoteDataSource dataSource;
  late ApiManager apiManager;
  NewsViewModel() : super(NewsLoadingState()){
    apiManager=ApiManager();
    dataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository=NewsRepositoryImpl(dataSource: dataSource);
  }

  void getNews(String sourceId) async {

    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
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
