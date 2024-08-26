import 'new/API.dart';

class Consts {
   static const baseurl = "http://api.weatherstack.com";
   static const apiKey = "8663c005dfafc9645c37d75be196692b";
   static const endpoints = "/current";
   static const endpoints2 = "/forecast";

   String apiCurrent = API(
      baseUrl: baseurl,
      apiKey: apiKey,
      endPoint: endpoints,
   ).URL(queries: { });

   String apiforecast = API(
      baseUrl: baseurl,
      apiKey: apiKey,
      endPoint: endpoints2,
   ).URL(queries: { });
}
