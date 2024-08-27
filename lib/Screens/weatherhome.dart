import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/weather_cubit.dart';

class Weatherhome extends StatelessWidget {
  final String cityName;

  Weatherhome({required this.cityName});

  // Method to get the background color based on weather condition
  Color? _getBackgroundColor(String weather) {
    // print(weather);
    // print("@#@##@#@#@##@#@##@#@##@#@");
    switch (weather) {
      case "Sunny":
        return Colors.yellowAccent[100] ?? Colors.yellow;
      case "Partly Cloudy":
        return Colors.grey[400] ?? Colors.grey;
      case "Rainy" || "rainy" :
        return Colors.blueGrey[900] ?? Colors.blueGrey;
      case "clear" || "Clear" :
        return Colors.grey[100] ?? Colors.grey[300];
      default:
        return Colors.cyanAccent ?? Colors.grey[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..get_weather(cityName),
      child: Scaffold(
        // Dynamically set the background color based on weather condition
        appBar: AppBar(
          title: Text("Weather News",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),backgroundColor:Colors.black ,
        ),
        backgroundColor: Colors.black,
        
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccesful) {
              // Get the background color based on the weather condition
              Color backgroundColor = _getBackgroundColor(state.weather_data.weatherDescription) ?? Colors.grey[100]!;

              return Container(
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.weather_data.location, // Example: "Barcelona"
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 137, 16, 16),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          ", ${state.weather_data.feelsLike}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      state.weather_data.Country,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset('assets/thunder.png'), // Example: Weather icon
                    const SizedBox(height: 20),
                    Text(
                      "${state.weather_data.description}", // Example: 22°C
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      state.weather_data.feelsLike, // Example: "Sunny"
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Max Temp ${state.weather_data.temperature}°C",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      "Min Temp ${state.weather_data.temperature}°C",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is Weatherfailed) {
              return Center(
                child: Text(
                  'Failed to load weather data: ${state.error}',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Center(child: Text('Please search for a city.'));
            }
          },
        ),
      ),
    );
  }
}
