import 'package:flutter/material.dart';
import 'package:pangains/Screens/Guest/guest_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class GuestWorkoutFinished extends StatelessWidget {
  const GuestWorkoutFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clint = StreamChatClient("apiKey");
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Well Done",
            style: TextStyle(color: Colors.green, fontSize: 24),
          ),
          Text(
            "You Finished the workout",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            "Sign Up and View better Stuff!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GuestScreen(clint),
                ));
              },
              child: Text("Finish")),
        ],
      )),
    );
  }
}
