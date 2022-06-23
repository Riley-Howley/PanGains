import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../Screens/Workouts/populated_workout_screen.dart';

var PREVIOUSKG = 0;
var PREVIOUSREP = 0;

class Set_row extends StatefulWidget {
  @override
  int id;
  int kg;
  int rep;
  bool isChecked;
  int exerciseId;
  Set_row(
    this.id,
    this.kg,
    this.rep,
    this.isChecked,
    this.exerciseId,
  );
  State<Set_row> createState() => _Set_rowState();
}

class _Set_rowState extends State<Set_row> {
  var kgController = TextEditingController();
  var repController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: widget.isChecked ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${widget.id}",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            "--------",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          // Text(
          //   " 7x7  ",
          //   style: TextStyle(fontSize: 20, color: Colors.white),
          // ),
          // Text(
          //   "${widget.kg}",
          //   style: TextStyle(fontSize: 20, color: Colors.white),
          // ),
          Container(
            width: 26,
            child: TextField(
              onChanged: ((value) {
                PREVIOUSKG = int.parse(value);
              }),
              controller: kgController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: PREVIOUSKG == 0 ? "0" : PREVIOUSKG.toString(),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // Text(
          //   "${widget.rep}",
          //   style: TextStyle(fontSize: 20, color: Colors.white),
          // ),
          Container(
            width: 26,
            child: TextField(
              onChanged: ((value) {
                PREVIOUSREP = int.parse(value);
              }),
              controller: repController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: PREVIOUSREP == 0 ? "0" : PREVIOUSREP.toString(),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          !widget.isChecked
              ? IconButton(
                  onPressed: () {
                    countDownTimer.onExecute.add(StopWatchExecute.reset);
                    countDownTimer.onExecute.add(StopWatchExecute.start);
                    finishedSets.add(new Set_row(
                      widget.id,
                      PREVIOUSKG == 0
                          ? int.parse(kgController.text)
                          : PREVIOUSKG,
                      PREVIOUSREP == 0
                          ? int.parse(repController.text)
                          : PREVIOUSREP,
                      widget.isChecked,
                      widget.exerciseId,
                    ));
                    setState(() {
                      widget.isChecked = !widget.isChecked;
                    });
                  },
                  icon: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    finishedSets.removeWhere((set) => set.id == widget.id);
                    setState(() {
                      widget.isChecked = !widget.isChecked;
                    });
                  },
                  icon: Icon(
                    Icons.check_box_rounded,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
