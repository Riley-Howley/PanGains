import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            "Hanging Knee Raises",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Theme(
          data: ThemeData(
            unselectedWidgetColor: Color(0xffBDBDBD), // Your color
          ),
          child: Checkbox(
            value: false,
            onChanged: (val) {},
          ),
        )
      ],
    );
  }
}
