import 'package:flutter/material.dart';
import 'package:pangains/Screens/Community/community_screen.dart';
import 'package:pangains/Screens/Dashboard/home_dashboard.dart';
import 'package:pangains/Screens/LeaderBoard/leaderboard_screen.dart';
import 'package:pangains/Screens/Workouts/workout_screen.dart';
import 'package:pangains/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xff335Ef5),
          onPrimary: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
          secondary: Color(0xff335Ef5),
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      routes: {
        '/accounts': (context) => HomeDashboardScreen(),
        '/workouts': (context) => WorkOutScreen(),
        '/community': (context) => CommunityScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
      },
    );
  }
}
