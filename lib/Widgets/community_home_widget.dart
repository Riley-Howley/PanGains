import 'package:flutter/material.dart';

class CommunityHome extends StatelessWidget {
  const CommunityHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 173),
          child: Text(
            "When you follow people, you can see",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Container(
          child: Text(
            "stuff they’ve posted here",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Explore The PanGains Community"),
          ),
        ),
      ],
    );
  }
}
