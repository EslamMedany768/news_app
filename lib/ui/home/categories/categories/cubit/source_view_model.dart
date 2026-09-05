import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/news/dataSources/news_remote_data_source.dart';
import 'package:news_app/repository/news/dataSources/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_data_sources_impl.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_date_sources.dart';
import 'package:news_app/repository/sources/repository/source_repository.dart';
import 'package:news_app/repository/sources/repository/source_repository_impl.dart';
import 'package:news_app/ui/home/categories/categories/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceState> {
  late ApiManager apiManager;
  late SourceRemoteDataSources dataSources;
  late SourceRepository sourceRepository;

  SourceViewModel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
    dataSources = SourceRemoteDataSourcesImpl(apiManager: apiManager);
    sourceRepository = SourceRepositoryImpl(dataSources: dataSources);
  }

  void getSourcesCategories(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);

      if (response!.status == "error") {
        print("error");
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
