import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color subBackgroundColor = Colors.white.withOpacity(0.17);
Color mainColor = Colors.blue.shade100;
Color mainTitlesColor = Colors.black;
Color subTitlesColor = Colors.white;

class Weatherhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
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
                color: subBackgroundColor,
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
                
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: subBackgroundColor,
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

      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Barcelona",
              style: TextStyle(
                fontSize: 25,
                color: mainTitlesColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              ", Spain",
              style: TextStyle(
                fontSize: 15,
                color: mainTitlesColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Text(
          "26 August 2024",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        

        const SizedBox(
          height: 20,
        ),
        

        Image.asset('assets/thunder.png'),
        
        
        const SizedBox(
          height: 20,
        ),
        
        Text(
          "22^ C",
          style: TextStyle(
            fontSize: 40,
            color: mainTitlesColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "Sunny",
          style: TextStyle(
            fontSize: 20,
            color: mainTitlesColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Max Temp 24^ C",
          style: TextStyle(
            fontSize: 12,
            color: mainTitlesColor,
          ),
        ),
        const SizedBox(width: 50),
        Text(
          "Min Temp 20^ C",
          style: TextStyle(
            fontSize: 12,
            color: mainTitlesColor,
          ),
        ),
      ],
    ),

    );
  }
}
