// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:pangains/Screens/Community/community_screen.dart';
import 'package:pangains/Screens/Community/public_account_screen.dart';
import 'package:pangains/Screens/Dashboard/home_dashboard.dart';
import 'package:pangains/Screens/LeaderBoard/leaderboard_screen.dart';
import 'package:pangains/Screens/Workouts/populated_workout_screen.dart';
import 'package:pangains/Screens/Workouts/workout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Http/requests.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var pass = prefs.getString('pass');
  if (email != null || pass != null) {
    await Login(email!, pass!);
    if (code == 200) {
      await getSpecificAccount(email);
      await getSpecificStatistic(listSpecificAccount[0].accountID);
    }
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
          '/publicAccount': (context) => PublicAccountScreen(),
          '/populatedWorkout': (context) => PopulatedWorkoutScreen(),
        },
        home: email == null || pass == null
            ? SignInScreen()
            : HomeDashboardScreen(),
      ),
    );
  }
}
