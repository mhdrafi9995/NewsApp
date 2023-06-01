import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:newstoday/commen/api_key_all_news.dart';
import 'package:newstoday/end_url.dart/end_url.dart';
import 'package:newstoday/model/new_model.dart';

class Services {
  Dio dio = Dio();
  final baseUrl = ApiBaseUrl();
  final endUrl = ApiEndUrl();
  // ALL NEWS RESULT
  Future<NewsModel?> getAllNewsResult() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.all);
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final getAllNewsResult = NewsModel.fromJson(response.data);
        log(getAllNewsResult.toString());
        return getAllNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get all news error');
    }
    return null;
  }
  // SPORTS NEWS RESULT

  Future<NewsModel?> getSports() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.sports);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final getSportsNewsResult = NewsModel.fromJson(response.data);
        return getSportsNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: "get all news error");
    }
    return null;
  }
  // BUSINESS NEWS RESULT

  Future<NewsModel?> getBesiness() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.business);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 2011) {
        final getBesinessNewsResult = NewsModel.fromJson(response.data);
        return getBesinessNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: "get all news error");
    }
    return null;
  }

  Future<NewsModel?> getScience() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.science);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) ;
      final getScienceNewResult = NewsModel.fromJson(response.data);
      return getScienceNewResult;
    } on DioError catch (error) {
      log(error.message.toString(), name: "get all new error");
    }
    return null;
  }
}
