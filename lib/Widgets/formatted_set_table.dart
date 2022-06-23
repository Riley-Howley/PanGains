import 'package:flutter/material.dart';

class FormattedSetTable extends StatefulWidget {
  const FormattedSetTable({Key? key}) : super(key: key);

  @override
  State<FormattedSetTable> createState() => _FormattedSetTableState();
}

class _FormattedSetTableState extends State<FormattedSetTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Set",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          "Previous",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          "Kg",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          "Reps",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          "Checked",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    ));
  }
}
