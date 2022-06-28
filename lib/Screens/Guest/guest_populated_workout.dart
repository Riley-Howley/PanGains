import 'package:flutter/material.dart';
import 'package:pangains/Models/exercise.dart';
import 'package:pangains/Models/folder.dart';
import 'package:pangains/Screens/Guest/guest_formatted_set.dart';
import 'package:pangains/Screens/Guest/guest_workout_finished.dart';
import 'package:pangains/Screens/Workouts/workout_finished_screen.dart';
import 'package:pangains/Screens/Workouts/workout_screen.dart';
import 'package:pangains/Widgets/account_routine_widget.dart';
import 'package:pangains/Widgets/formatted_set_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../Http/requests.dart';
import '../../Widgets/set_row.dart';
import 'guest_workout.dart';

List<Exercise> listExercises = [];
List<Set_row> finishedSets = [];

final StopWatchTimer countDownTimer = StopWatchTimer(
  mode: StopWatchMode.countDown,
  presetMillisecond: StopWatchTimer.getMilliSecFromSecond(0),
  // onChange: (value) => print('onChange $value'),
  // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
  // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  onStop: () {
    // print('onStop');
  },
  onEnded: () {
    // print('onEnded');
  },
);

class GuestPopulatedWorkoutScreen extends StatefulWidget {
  int routineId;
  GuestPopulatedWorkoutScreen(this.routineId);

  @override
  State<GuestPopulatedWorkoutScreen> createState() =>
      _GuestPopulatedWorkoutScreenState();
}

class _GuestPopulatedWorkoutScreenState
    extends State<GuestPopulatedWorkoutScreen> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStop: () {
      // print('onStop');
    },
    onEnded: () {
      // print('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    //_stopWatchTimer.rawTime.listen((value) =>
    //print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    // _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    // _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    // _stopWatchTimer.records.listen((value) => print('records $value'));
    // _stopWatchTimer.fetchStop.listen((value) => print('stop from stream'));
    // _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    //countDownTimer.rawTime.listen((value) =>
    //print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    // countDownTimer.minuteTime.listen((value) => print('minuteTime $value'));
    // countDownTimer.secondTime.listen((value) => print('secondTime $value'));
    // countDownTimer.records.listen((value) => print('records $value'));
    // countDownTimer.fetchStop.listen((value) => print('stop from stream'));
    // countDownTimer.fetchEnded.listen((value) => print('ended from stream'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    // await _stopWatchTimer.dispose();
    // await countDownTimer.dispose();
  }

  int count = 1;
  String totalTime = "";
  int hour = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController folderNameController = TextEditingController();
    TextEditingController routineNameController = TextEditingController();
    Future restTimerDialog(int currentTime) => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              color: Color(0xff222831),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 24,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            countDownTimer.setPresetSecondTime(10);
                          },
                          child: const Text(
                            '+ 10s',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            countDownTimer.clearPresetTime();
                          },
                          child: const Text(
                            'Clear Time',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            countDownTimer.setPresetSecondTime(-10);
                          },
                          child: const Text(
                            '- 10s',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        leading: IconButton(
            onPressed: () {
              listOfExercises.clear();
              listAllSets.clear();
              // _stopWatchTimer.dispose();
              // countDownTimer.dispose();
              countDownTimer.clearPresetTime();
              PREVIOUSKG = 0;
              PREVIOUSREP = 0;
              Navigator.pushNamedAndRemoveUntil(
                  context, "/workouts", (r) => false);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                _stopWatchTimer.dispose();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GuestWorkoutFinished(),
                ));
              },
              child: Text(
                "Finish Workout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    child: Text(
                      "Empty Workout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Add exercises as you go",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 8),
                        child: StreamBuilder<int>(
                          stream: _stopWatchTimer.rawTime,
                          initialData: _stopWatchTimer.rawTime.value,
                          builder: (context, snap) {
                            final value = snap.data!;
                            var displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                hours: _isHours);
                            totalTime = displayTime;
                            hour = _stopWatchTimer.rawTime.value;
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    displayTime,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Icon(
                          Icons.timer_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32, left: 8),
                        child: StreamBuilder<int>(
                          stream: countDownTimer.rawTime,
                          initialData: countDownTimer.rawTime.value,
                          builder: (context, snap) {
                            final value = snap.data!;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                hours: false);
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: () {
                                      restTimerDialog(
                                          countDownTimer.rawTime.value);
                                    },
                                    child: Text(
                                      displayTime,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GuestFormattedSet(index);
                  },
                  itemCount: listOfExercises.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
