import 'package:flutter/material.dart';

class RowUserWidget extends StatelessWidget {
  String name;
  String url;
  RowUserWidget(this.name, this.url);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(url),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16, left: 18),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
