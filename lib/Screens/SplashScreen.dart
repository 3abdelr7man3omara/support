import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/onboarding_cubit.dart';
import 'package:untitled2/Screens/onboarding_screens.dart';
import 'package:untitled2/main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => OnboardingWrapper(),
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child:  LottieBuilder.asset('assets/lottie/Animation(1).json',fit: BoxFit.contain,),
      ),
    );
  }
}

class OnboardingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingComplete) {
            return AuthGate();
          } else if (state is OnboardingNotComplete) {
            return OnboardingPageView();
          } else {
            // Handle other states if necessary
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}