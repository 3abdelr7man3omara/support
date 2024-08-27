import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/Screens/Explore_Screen.dart';
import 'package:untitled2/Screens/acount_screen.dart';
import 'package:untitled2/Screens/home_screen.dart';
import 'package:untitled2/Screens/weatherhome.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  List<Widget> screens = [];
  int _currentIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  String cityName = "Barcelona"; // Default city name
  TextEditingController cityController = TextEditingController();
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _loadCityName();
  }

  Future<void> _loadCityName() async {
    if (user != null) {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey('cityName')) {
          setState(() {
            cityName = data['cityName'];
            isFirstTime = false;
            _updateScreens();
          });
        }
      }
    }
  }

  Future<void> _saveCityName(String cityName) async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'cityName': cityName,
      }, SetOptions(merge: true));
    }
  }

  void _updateScreens() {
    setState(() {
      screens = [
        ExploreScreen(),
        Weatherhome(cityName: cityName),
        Acount_Screen(),
      ];
    });
  }

  void _updateCityName() {
    if (cityController.text.isNotEmpty) {
      setState(() {
        cityName = cityController.text;
        isFirstTime = false;
        _updateScreens();
        _saveCityName(cityName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      return Scaffold(
        appBar: AppBar(title: Text('Welcome')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'Enter your city name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateCityName,
                child: Text('Set City'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedLabelStyle: TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.w700, fontSize: 20),
        selectedFontSize: 20,
        iconSize: 20,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Colors.yellow),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.yellow),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.yellow),
            label: user?.displayName ?? 'Account',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(cityName),
      ),
    );
  }
}