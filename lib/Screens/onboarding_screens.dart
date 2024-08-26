import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/onboarding_cubit.dart';
import 'package:untitled2/main.dart';


class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Onboarding Screen 1')),
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Onboarding Screen 2')),
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            context.read<OnboardingCubit>().completeOnboarding();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AuthGate(),
            ));
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}

class OnboardingPageView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnboardingScreen1(),
        OnboardingScreen2(),
        OnboardingScreen3(),
      ],
      
    );
  }
}
