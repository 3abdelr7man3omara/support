
import 'package:dio/dio.dart';
import 'package:untitled2/models/weather_model.dart';

class WeatherServices{

  Dio dio = Dio();

  Future<weather_request>get_data(
      {required String path ,required Map<String,dynamic>query }) async{
    Response response =await dio.get(path,queryParameters: query);

    Map<String,dynamic> jsondata = response.data;
    List<dynamic> data = jsondata["articles"];
    late weather_request actual_data =weather_request.fromjson(data) ;

    return actual_data;

  }



}