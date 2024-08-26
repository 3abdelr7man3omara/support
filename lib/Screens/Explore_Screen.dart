import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _currentLocation = "Cairo, Egypt"; // Example location
  String _currentTemperature = "25°C";
  String _currentWeather = "Partly Cloudy"; // => API
  String _currentHumidity = "50%";
  String _currentWindSpeed = "15 km/h";
  String _searchQuery = "";

  List<Map<String, String>> _weeklyForecast = [
    {"day": "Mon", "temperature": "24°C", "weather": "Sunny"},
    {"day": "Tue", "temperature": "22°C", "weather": "Partly Cloudy"},
    {"day": "Wed", "temperature": "20°C", "weather": "Rainy"},
    {"day": "Thu", "temperature": "23°C", "weather": "Sunny"},
    {"day": "Fri", "temperature": "26°C", "weather": "Sunny"},
    {"day": "Sat", "temperature": "27°C", "weather": "Sunny"},
    {"day": "Sun", "temperature": "28°C", "weather": "Sunny"},
    {"day": "Next Week", "temperature": "N/A", "weather": "N/A"},
  ];

  void _searchLocation() {
    // Implement search functionality here
    setState(() {
      _searchQuery = _searchController.text;
    });
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
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon = _getWeatherIcon(_currentWeather);

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                          border: InputBorder.none,
                          hintText: 'Search for a location...',
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        onSubmitted: (_) => _searchLocation(),
                      ),
                    ),
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
                      _currentLocation,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: Icon(
                            weatherIcon,
                            key: ValueKey<String>(_currentWeather),
                            size: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$_currentTemperature - $_currentWeather",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Humidity: $_currentHumidity",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "Wind Speed: $_currentWindSpeed",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "10 km", // Example visibility data
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Moderate", // Example UV Index data
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
              SizedBox(height:20,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "10 km", // Example visibility data
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Moderate", // Example UV Index data
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
                    IconData dayWeatherIcon = _getWeatherIcon(forecast['weather'] ?? '');

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              key: ValueKey<String>(forecast['weather'] ?? ''),
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
      ),
    );
  }
}
