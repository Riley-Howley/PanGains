import 'package:flutter/material.dart';
import 'package:pangains/Screens/Payment/payment_card.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class PaymentUIScreen extends StatelessWidget {
  final StreamChatClient client;
  PaymentUIScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Image.asset("assets/images/CrownSimple.png"),
              ),
            ),
            Container(
              child: Text(
                "Get A Pro Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "Today!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "UNLIMITED",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    " Folders",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "UNLIMITED",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    " Routines",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "UNLIMITED",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    " Exercises",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Annual Plan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "\$48/Year",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "20% Discount",
                style: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaymentCardScreen(client),
                  ));
                },
                child: Text("Subscribe Anually"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
