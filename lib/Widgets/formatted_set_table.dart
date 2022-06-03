import 'package:flutter/material.dart';
import '../Http/requests.dart';

class FormattedSetTable extends StatefulWidget {
  const FormattedSetTable({Key? key}) : super(key: key);

  @override
  State<FormattedSetTable> createState() => _FormattedSetTableState();
}

class _FormattedSetTableState extends State<FormattedSetTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
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

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 300,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       return listOfSets[index];
            //     },
            //     itemCount: listOfSets.length,
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // listOfSets.add(new Set_row(count++, 0, 0, false));
            //     setState(() {});
            //   },
            //   child: Text(
            //     "Add Set",
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Finish Workout",
            //   ),
            // ),
          ],
        ));
  }
}
