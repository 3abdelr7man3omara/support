import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/Screens/SplashScreen.dart';
import 'package:untitled2/Screens/home_screen.dart';
import 'package:untitled2/Screens/news_Screen.dart';
import 'package:untitled2/Screens/weather_home_screen.dart';
import 'package:untitled2/Screens/sing_in.dart'; // Import your SplashScreen
import 'package:untitled2/cubits/counter_cubit.dart';
import 'package:untitled2/cubits/news_cubit.dart';
import 'package:untitled2/cubits/sing_in_up_cubti.dart';
import 'package:untitled2/cubits/sing_in_up_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..get_news()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => AuthCubit(FirebaseAuth.instance)),
      ],
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return WeatherHomeScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}


