import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Acount_Screen extends StatefulWidget {
  const Acount_Screen({super.key});

  @override
  State<Acount_Screen> createState() => _Acount_ScreenState();
}

class _Acount_ScreenState extends State<Acount_Screen> {
  bool _switchValue = true;
  bool _switchValue2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.network(
            "https://img.freepik.com/premium-photo/old-texture-black-yellow-background-ai-generated-image_532963-7007.jpg", // Replace with your image URL
            fit: BoxFit.fill,
          ),
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
                    "User Name from fire base",
                    style: TextStyle(fontSize: 20, color: Colors.white), // Adjust text color for visibility
                  ),
                  SizedBox(height: 20),
                  Text(
                    "User Email",
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
                        onPressed: () {},
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
