import 'package:news_app/model/newsResponse.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
