import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/news/dataSources/news_remote_data_source.dart';

import '../../../model/newsResponse.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId, int page) async {
    var response = await apiManager.getNewsBySourceId(sourceId, page);
    return response;
  }
}
