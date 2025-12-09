import 'package:flutter/material.dart';
import 'package:news_app/model/sourcesRespone.dart';

abstract class SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceState {
  List<Sources> sourcesList;
  SourceSuccessState({required this.sourcesList});
}
