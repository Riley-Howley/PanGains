import 'package:flutter/material.dart';
import 'package:pangains/Widgets/set_row.dart';

import '../Screens/Workouts/populated_workout_screen.dart';
import 'formatted_set_table.dart';

class FormattedSetWidget extends StatefulWidget {
  int nameIndex;
  FormattedSetWidget(this.nameIndex);

  @override
  State<FormattedSetWidget> createState() => _FormattedSetWidgetState();
}

class _FormattedSetWidgetState extends State<FormattedSetWidget> {
  List<Set_row> listSets = [];
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                listExercises[widget.nameIndex].ExerciseName,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        FormattedSetTable(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return listSets[index];
            },
            itemCount: listSets.length,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: Color(0xff335EF5),
              width: 4,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff222831),
            ),
            onPressed: () {
              listSets.add(new Set_row(
                count++,
                PREVIOUSKG == 0 ? 0 : PREVIOUSKG,
                PREVIOUSREP == 0 ? 0 : PREVIOUSREP,
                false,
                listExercises[widget.nameIndex].id,
              ));
              setState(() {});
              print(listSets.length);
            },
            child: Text(
              "Add Set",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
