import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_date_sources.dart';
import 'package:news_app/repository/sources/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSources dataSources;
  SourceRepositoryImpl({required this.dataSources});
  @override
  Future<Source?> getSources(String categoryId) async {
    var response = await dataSources.getSources(categoryId);
    return response;
  }
}
