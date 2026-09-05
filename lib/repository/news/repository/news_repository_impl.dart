import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/repository/news/dataSources/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource dataSource;
  NewsRepositoryImpl({required this.dataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId,int page) async{
    var response=await dataSource.getNewsBySourceId(sourceId,page);
    return response;

  }
}