import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Constants.dart';
import 'package:weather/Cubits/States/getWeatherCubit.dart';
import 'package:weather/Models/WeatherModel.dart';


WeatherModel? wm;

class DialogCard extends StatefulWidget {
  @override
  State<DialogCard> createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogCard> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: subBackgroundColor,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose \nyour City",
                    style: TextStyle(
                        fontSize: 20,
                        color: subTitlesColor,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: TextField(
                      onSubmitted: (value) async {
                        var getweatherCubit = BlocProvider.of<getWeatherCubit>(context);
                        getweatherCubit.getWeather(city: value);
                        Navigator.of(context).pop();
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), 
      
                        hintText: "Enter a city or a country ..",
                        hintStyle: const TextStyle(
                          fontSize: 13,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none, 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none, 
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Center(
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.transparent,
                          ),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
