import 'package:flutter/material.dart';

class AccountRoutineWidget extends StatelessWidget {
  String name;
  AccountRoutineWidget(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Color(0xff222831),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(color: Colors.white),
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${name}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
