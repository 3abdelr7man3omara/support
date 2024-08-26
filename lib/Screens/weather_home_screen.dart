import 'package:flutter/material.dart';
import 'package:untitled2/Screens/Explore_Screen.dart';
import 'package:untitled2/Screens/acount_screen.dart';
import 'package:untitled2/Screens/home_screen.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  List Screens = [ExploreScreen(),HomeScreen(),Acount_Screen() ];
  int _currentIndex = 0; // State variable to track the selected tab index.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedLabelStyle: TextStyle(color: Colors.yellow ,fontWeight: FontWeight.w700 ,fontSize: 20),
        selectedFontSize: 20,
        iconSize: 20,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex, // Set the current index.
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the state on tab change.
          });
        },
        items: const [
          BottomNavigationBarItem(

            icon: Icon(Icons.explore,color: Colors.yellow,),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,color: Colors.yellow,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.yellow,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

