import 'package:flutter/material.dart';
import 'package:pangains/main.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../Dashboard/home_dashboard.dart';

class PaymentCardScreen extends StatelessWidget {
  final StreamChatClient client;
  PaymentCardScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Pro",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Subscription",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "Card Number",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            TextField(
              maxLength: 16,
              decoration: InputDecoration(
                hintText: "1234-5678-9102-3456",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Name on card",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "Expiry",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "CCV",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    maxLength: 4,
                    decoration: InputDecoration(
                      hintText: "MM/YY",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    maxLength: 3,
                    decoration: InputDecoration(
                      hintText: "000",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Cost: \$48/yr",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeDashboardScreen(client),
                  ));
                },
                child: Text("Subscribe"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
