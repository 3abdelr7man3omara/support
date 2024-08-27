import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/models/weather_model.dart';
import '../consts.dart';
import '../services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> get_weather(String query) async {
    emit(WeatherLoading());
    try {
      weather_request weather_data = await WeatherServices().get_data(
        path: Consts().apiCurrent,
        query: {"query": query.trim()}, // Trim spaces
      );
      print("Done successfully");
      emit(WeatherSuccesful(weather_data: weather_data));
    } catch (e) {
      print("Error: $e"); // Log the error for debugging
      emit(Weatherfailed(error: e.toString()));
    }
  }

  Future<void> get_weather_fore_cast(String query) async {
    emit(WeatherLoading());
    try {
      weather_request weather_data = await WeatherServices().get_data(
        path: Consts().apiCurrent,
        query: {
          "query": query.trim(), // Trim spaces
          "forecast_days": "7", // Remove extra spaces
        },
      );
      print("Done successfully");
      emit(WeatherSuccesful(weather_data: weather_data));
    } catch (e) {
      print("Error: $e"); // Log the error for debugging
      emit(Weatherfailed(error: e.toString()));
    }
  }
}