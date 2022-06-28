import 'package:flutter/material.dart';
import 'package:pangains/Screens/Auth%20Screens/signup_screen.dart';
import 'package:pangains/Screens/Guest/guest_workout.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

var guestJWT =
    "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJKb3JkYW4iLCJleHAiOjE2NTY1MDU2MjUsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyMzQvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzIzNC8ifQ.h4GQQSbijyzirsRfJ5tKhzfRAKrfPtW4i53sRdE_mn9cxta6074et5x2y_GJXeJwPScZlI_Q6F_y26gQ3XEa6A";

class GuestScreen extends StatelessWidget {
  final StreamChatClient client;
  GuestScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: 200,
                child: Text(
                  "Your Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    "Workouts",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GuestWorkoutScreen(),
                    ));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          "https://www.citypng.com/public/uploads/preview/white-user-member-guest-icon-png-image-31634946729lnhivlto5f.png")),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Guest Account",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Your Stats:",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Unavailable for Guests",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupScreen(client),
                  ));
                },
                child: Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
