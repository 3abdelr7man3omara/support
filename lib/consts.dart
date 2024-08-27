import 'new/API.dart';

class Consts {
   static const baseurl = "http://api.weatherstack.com";
   static const apiKey = "bb15dcc7c6ce03a62c4e49b35b9a57f8";
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
