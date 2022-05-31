import 'package:flutter/material.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Http/requests.dart';
import 'Screens/Community/community_screen.dart';
import 'Screens/Community/public_account_screen.dart';
import 'Screens/Dashboard/home_dashboard.dart';
import 'Screens/LeaderBoard/leaderboard_screen.dart';
import 'Screens/Workouts/populated_workout_screen.dart';
import 'Screens/Workouts/workout_screen.dart';
import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');
  // var pass = prefs.getString('pass');

  // if (email != null || pass != null) {
  //   await Login(email!, pass!);
  //   if (code == 200) {
  //     await getSpecificAccount(email);
  //     await getSpecificStatistic(listSpecificAccount[0].accountID);
  //   }
  // }
  //email == null || pass == null ? SplashScreen() :
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInScreen(),
    //make a nice login spinner screen to say auto logging in
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
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
