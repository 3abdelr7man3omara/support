import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/weather_cubit.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

Future<String> fetchDefaultCity() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    return doc.data()?['cityName'] ??
        "London"; // Fallback to a default city if not found
  }
  return "London"; // Fallback if user is not authenticated
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _currentLocation = "Cairo, Egypt"; // Example location
  String _currentTemperature = "25°C";
  String _currentWeather = "Partly Cloudy"; // => API
  String _currentHumidity = "50%";
  String _currentWindSpeed = "15 km/h";
  String _searchQuery = ""; // Default value

  List<Map<String, String>> _weeklyForecast = [
    {"day": "Mon", "temperature": "24°C", "weather": "Sunny"},
    {"day": "Tue", "temperature": "22°C", "weather": "Partly Cloudy"},
    {"day": "Wed", "temperature": "20°C", "weather": "Rainy"},
    {"day": "Thu", "temperature": "23°C", "weather": "Sunny"},
    {"day": "Fri", "temperature": "26°C", "weather": "Sunny"},
    {"day": "Sat", "temperature": "27°C", "weather": "Clear"},
    {"day": "Sun", "temperature": "28°C", "weather": "Sunny"},
    {"day": "Next Week", "temperature": "N/A", "weather": "N/A"},
  ];

  @override
  void initState() {
    super.initState();
    _initializeDefaultCity();
  }

  Future<void> _initializeDefaultCity() async {
    String cityName = await fetchDefaultCity();
    print("cityName: " + cityName);
    setState(() {
      _searchQuery = cityName;
    });
    print("SEAARCH_QUERY: " + _searchQuery);
    // Fetch weather for the default city
  }

  Color? _getBackgroundColor(String weather) {
    switch (weather) {
      case "Sunny":
        return Colors.blue[200] ?? Colors.blue;
      case "Partly Cloudy":
        return Colors.grey[300] ?? Colors.grey;
      case "Rainy":
        return Colors.blueGrey[900] ?? Colors.blueGrey;
      default:
        return Colors.grey[100] ?? Colors.grey[300];
    }
  }

  IconData _getWeatherIcon(String weather) {
    switch (weather) {
      case "Sunny":
        return Icons.wb_sunny;
      case "Partly Cloudy":
        return Icons.cloud;
      case "Rainy":
        return Icons.beach_access;
      case "Clear" :
        return Icons.wb_sunny_outlined;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon = _getWeatherIcon("_currentWeather");
    return _searchQuery.isEmpty ?
    Center(
            child:
                CircularProgressIndicator()) // Show loading indicator while fetching the city
        : BlocProvider(
            create: (context) => WeatherCubit()..get_weather(_searchQuery),
            child: Scaffold(
              backgroundColor: _getBackgroundColor(_currentWeather),
              appBar: AppBar(
                title: Text(
                  "Explore",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
              body: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is Weatherfailed) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else if (state is WeatherSuccesful) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search bar
                            Container(
                              margin: const EdgeInsets.only(bottom: 16.0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      hintText: 'Search for a location...',
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.search,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            _searchQuery =
                                                _searchController.text;
                                          });
                                          context
                                              .read<WeatherCubit>()
                                              .get_weather(_searchQuery);
                                        },
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ],
                              ),
                            ),
                            // Current Weather Container
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.weather_data.Country,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        _getWeatherIcon(state
                                            .weather_data.weatherDescription),
                                        size: 50,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.weather_data.temperature} - ${state.weather_data.weatherDescription}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // Text(
                                          //   "Humidity: ${state.weather_data.humidity}",
                                          //   style: TextStyle(
                                          //     fontSize: 16,
                                          //     color: Colors.white70,
                                          //   ),
                                          // ),
                                          Text(
                                            "Wind Speed: ${state.weather_data.windSpeed}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // Additional Information Boxes
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "humidity",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${state.weather_data.humidity}", // Example visibility data
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "feelsLike",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${state.weather_data.feelsLike} C", // Example UV Index data
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Visibility",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${state.weather_data.visibility} KM", // Example visibility data
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "UV Index",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${state.weather_data.uvIndex}", // Example UV Index data
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 80),
                            Center(
                              child: Text(
                                "Week Forecast",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 35),
                            // Horizontal Row for Forecast
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _weeklyForecast.length,
                                itemBuilder: (context, index) {
                                  final forecast = _weeklyForecast[index];
                                  IconData dayWeatherIcon = _getWeatherIcon(
                                      forecast['weather'] ?? '');

                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.9),
                                          spreadRadius: 2,
                                          blurRadius: 9,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          forecast['day']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        AnimatedSwitcher(
                                          duration: const Duration(seconds: 1),
                                          child: Icon(
                                            dayWeatherIcon,
                                            key: ValueKey<String>(
                                                forecast['weather'] ?? ''),
                                            size: 50,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          forecast['temperature']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          forecast['weather']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text('Please enter a location.'));
                  }
                },
              ),
            ),
          );
  }
}
