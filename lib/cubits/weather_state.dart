part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
final class WeatherLoading extends WeatherState {}
final class Weatherfailed extends WeatherState {
  final String error ;

  Weatherfailed({required this.error});

}
final class WeatherSuccesful extends WeatherState {
  final weather_request weather_data;

  WeatherSuccesful({required this.weather_data});

}