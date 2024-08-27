import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/Screens/SplashScreen.dart';
import 'package:untitled2/Screens/sing_in.dart';

import '../main.dart';

class Acount_Screen extends StatefulWidget {
  const Acount_Screen({super.key});

  @override
  State<Acount_Screen> createState() => _Acount_ScreenState();
}
Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
Future <Widget> _signOut_()  async{
  await FirebaseAuth.instance.signOut();

  return new SignInScreen();
}
class _Acount_ScreenState extends State<Acount_Screen> {
  bool _switchValue = true;
  bool _switchValue2 = true;
  User? user = FirebaseAuth.instance.currentUser; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/back.jpeg',fit : BoxFit.fill),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3276/3276535.png"),
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    user?.displayName ?? " ", 
                    style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                  ),
                  SizedBox(height: 20),
                  Text(
                    user?.email?? " ",
                    style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                  ),
                  SizedBox(height: 20),
                  Text(
                    "User current location",
                    style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                  ),
                  SizedBox(height: 20),
                  // Adding the toggle switch button for dark mode
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                      ),
                      Switch(
                        activeColor: Colors.yellow,
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ar",
                        style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                      ),
                      Switch(
                        activeColor: Colors.yellow,
                        value: _switchValue2,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue2 = value;
                          });
                        },
                      ),
                      Text("en",
                      style:TextStyle(color: Colors.white,fontSize: 20) ,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, size: 40, color: Colors.white), // Adjust icon color for visibility
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  MyApp() ));
                        },
                        icon: Icon(Icons.logout, size: 40, color: Colors.white), // Adjust icon color for visibility
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
