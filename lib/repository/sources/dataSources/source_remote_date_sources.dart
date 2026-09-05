import '../../../model/sourcesRespone.dart';

abstract class SourceRemoteDataSources {
  Future<Source?> getSources(String categoryId);
}
