class weather_request {
  final String location;
  final String humidity;
  final String visibility;
  final String uvIndex;
  final String temperature;
  final String weatherCode;
  final String weatherDescription;
  final String windSpeed;
  final String weatherIcon;
  final String feelsLike;

  weather_request({
    required this.location,
    required this.humidity,
    required this.visibility,
    required this.uvIndex,
    required this.temperature,
    required this.weatherCode,
    required this.weatherDescription,
    required this.windSpeed,
    required this.weatherIcon,
    required this.feelsLike,
  });

  factory weather_request.fromjson(Map<String, dynamic> json) {
    return weather_request(
      location: json["location"]["name"],
      humidity: json["current"]["humidity"].toString(),
      visibility: json["current"]["visibility"].toString(),
      uvIndex: json["current"]["uv_index"].toString(),
      temperature: json["current"]["temperature"].toString(),
      weatherCode: json["current"]["weather_code"].toString(),
      weatherDescription: json["current"]["weather_descriptions"][0],
      windSpeed: json["current"]["wind_speed"].toString(),
      weatherIcon: json["current"]["weather_icons"][0],
      feelsLike: json["current"]["feelslike"].toString(),
    );
  }
}
