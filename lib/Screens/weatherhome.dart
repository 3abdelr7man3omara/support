import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/weather_cubit.dart';

class Weatherhome extends StatelessWidget {
  final String cityName;

  Weatherhome({required this.cityName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..get_weather(cityName),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  // Trigger weather fetch with a specific city name (example: "Barcelona")
                  BlocProvider.of<WeatherCubit>(context).get_weather(cityName);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 142, 165, 22),
                  ),
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccesful) {
              // Display the weather data
              return Column(
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
                    state.weather_data.location,
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
                    "${state.weather_data.temperature}°C", // Example: 22°C
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
