import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/models/weather_model.dart';
import '../Screens/Explore_Screen.dart';
import '../consts.dart';
import '../services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());


  get_weather(String query) async {
    emit(WeatherLoading());
    try {
      weather_request weather_data = await WeatherServices().get_data(
          path: Consts().apiCurrent, query: {
        "query" : query ,
            }

          );
      emit(WeatherSuccesful(weather_data: weather_data));
//
    }
    catch (e) {
      emit(Weatherfailed(error: e.toString()));
    }
  }

  get_weather_fore_cast(String query) async {
    emit(WeatherLoading());
    try {
      weather_request weather_data = await WeatherServices().get_data(
          path: Consts().apiCurrent, query: {
        "query" : query ,
        "forecast_days" : " 7 "
      }

      );
      emit(WeatherSuccesful(weather_data: weather_data));

    }
    catch (e) {
      emit(Weatherfailed(error: e.toString()));
    }
  }
}