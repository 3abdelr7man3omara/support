
import 'package:dio/dio.dart';
import 'package:untitled2/models/Article.dart';

class NewsServices{

  Dio dio = Dio();

  Future<List<Article>> get_data(
  {required String path ,required Map<String,dynamic>query }) async{
    Response response =await dio.get(path,queryParameters: query);

    Map<String,dynamic> jsondata = response.data;
    List<dynamic> articles = jsondata["articles"];
    List<Article> articleList = [];
    for (var article in articles)
      {
        articleList.add(Article.fromjson(article));
      }
      return articleList;

  }



}