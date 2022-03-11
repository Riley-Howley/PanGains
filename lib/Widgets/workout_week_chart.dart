import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../Models/workouts_perweek.dart';

class WorkoutWeekChart extends StatelessWidget {
  final List<WorkoutsPerWeek> data;

  WorkoutWeekChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WorkoutsPerWeek, String>> series = [
      charts.Series(
        id: "Workouts",
        data: data,
        domainFn: (WorkoutsPerWeek series, _) => series.day,
        measureFn: (WorkoutsPerWeek series, _) => series.hours,
        colorFn: (WorkoutsPerWeek series, _) => series.color,
      ),
    ];

    return charts.BarChart(
      series,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle:
                  new charts.TextStyleSpec(color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec())),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle:
                  new charts.TextStyleSpec(color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec())),
    );
  }
}
