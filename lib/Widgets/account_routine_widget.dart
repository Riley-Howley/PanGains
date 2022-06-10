import 'package:flutter/material.dart';

class AccountRoutineWidget extends StatelessWidget {
  String name;
  AccountRoutineWidget(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 43, 43, 43),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
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
          Icon(
            Icons.fitness_center,
            color: Colors.white,
            size: 60,
          ),
        ],
      ),
    );
  }
}
