import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/sourcesRespone.dart';

class ApiManager {
  static Future<Source?> getSources(category) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=6c634c671e944a47b5c024affcb63740
    Uri url = Uri.https(ApiConstant.serverName, ApiEndPoint.apiRequestSources, {
      "apiKey": ApiConstant.apiKey,
      "category": category,
    });
    try {
      var response = await http.get(url);
      var body = response.body;
      var json = jsonDecode(body);
      return Source.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=6c634c671e944a47b5c024affcb63740
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.serverName, ApiEndPoint.apiRequestNews, {
      "sources": sourceId,
      "apiKey": ApiConstant.apiKey,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
