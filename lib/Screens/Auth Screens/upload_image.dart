import 'package:flutter/material.dart';
import 'package:pangains/Screens/Dashboard/home_dashboard.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class UploadImageScreen extends StatelessWidget {
  final StreamChatClient client;
  UploadImageScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey,
                child: Container(
                  child: Image.asset("assets/images/Upload.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "Upload A Photo Of Yourself",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                    "This lets people know who you are",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeDashboardScreen(client),
                    ),
                  );
                },
                child: Text(
                  "Upload",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
