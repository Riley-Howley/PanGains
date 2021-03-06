import 'package:flutter/material.dart';
import 'package:pangains/Widgets/set_row.dart';
import '../../Widgets/formatted_set_table.dart';
import 'guest_workout.dart';

class GuestFormattedSet extends StatefulWidget {
  int nameIndex;
  GuestFormattedSet(this.nameIndex);

  @override
  State<GuestFormattedSet> createState() => _GuestFormattedSetState();
}

class _GuestFormattedSetState extends State<GuestFormattedSet> {
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
                listOfExercises[widget.nameIndex].ExerciseName,
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
                listOfExercises[widget.nameIndex].id,
              ));
              setState(() {});
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
