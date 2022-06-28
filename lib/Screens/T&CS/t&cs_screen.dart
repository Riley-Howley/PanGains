import 'package:flutter/material.dart';

class TermsAndConditionsScreens extends StatelessWidget {
  const TermsAndConditionsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Text(
                "PanGains Terms & Conditions",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  "If this app breaks your phone we dont care, we take no responsibility for any injuries, heart breaks or embarrasement. Any Issues please dont hesitate to figure it out yourself. Cheers PanGains 2022",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
