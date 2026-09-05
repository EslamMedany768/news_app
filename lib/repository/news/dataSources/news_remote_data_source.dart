import 'package:news_app/model/newsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?>getNewsBySourceId(String sourceId,int page);
}