class weather_request {
  final String location ;
  final String humidity ;
  final String visibility ;
  final String UV_index ;
  final String temperature ;
  final String weather_code;
  final String weather_descriptions;
  final String wind_speed;
  final String weather_icons;
  final String feelslike;



  weather_request({required this.location,
    required this.humidity,
    required this.visibility,
    required this.UV_index,
    required this.temperature,
    required this.weather_code,
    required this.weather_descriptions,
    required this.wind_speed,
    required this.weather_icons,
    required this.feelslike,

  } );


  factory weather_request.fromjson(json){
    return weather_request(
      humidity: json["humidity"],
      visibility: json["visibility"],
      wind_speed : json["wind_speed"],
      weather_descriptions :json["weather_descriptions"],
      weather_code:json["weather_code"],
      temperature:json["temperature"],
      UV_index:json["uv_index"],
      location: json["region"],
      weather_icons: json["weather_icons"],
      feelslike: json["feelslike"],

    );
  }



}