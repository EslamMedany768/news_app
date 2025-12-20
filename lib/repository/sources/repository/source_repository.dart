import '../../../model/sourcesRespone.dart';

abstract class SourceRepository{
  Future<Source?> getSources(String categoryId);
}