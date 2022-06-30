import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:pangains/Screens/Auth%20Screens/signup_screen.dart';
import 'package:pangains/Screens/Guest/guest_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SplashScreen extends StatelessWidget {
  final StreamChatClient? client;
  SplashScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen(client!),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 40, right: 30),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 122),
                child: Image.asset("assets/images/PanGains.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: EdgeInsets.only(top: 300),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignupScreen(client!),
                    ));
                  },
                  child: Text("Sign Up"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GuestScreen(client!),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Text(
                    "Continue As Guest",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
