import 'package:flutter/material.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'Functions/PopulateAccountFolders.dart';
import 'Http/requests.dart';
import 'Screens/Community/community_screen.dart';
import 'Screens/Community/public_account_screen.dart';
import 'Screens/Dashboard/home_dashboard.dart';
import 'Screens/LeaderBoard/leaderboard_screen.dart';
import 'Screens/Messages/app.dart';
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
  final client = StreamChatClient(streamKey);

  runApp(MyApp(client));
}

class MyApp extends StatelessWidget {
  final StreamChatClient client;
  MyApp(this.client);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(
              child: child!,
            ),
          ),
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/accounts': (context) => HomeDashboardScreen(),
        '/workouts': (context) => WorkOutScreen(),
        '/community': (context) => CommunityScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
      },
      home: SplashScreen(client),
    );
  }
}
