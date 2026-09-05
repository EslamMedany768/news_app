import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_date_sources.dart';

class SourceRemoteDataSourcesImpl implements SourceRemoteDataSources{
  ApiManager apiManager;
  SourceRemoteDataSourcesImpl({required this.apiManager});
  @override
  Future<Source?> getSources(String categoryId) async{
    var response= await apiManager.getSources(categoryId);
    return response;
  }

}