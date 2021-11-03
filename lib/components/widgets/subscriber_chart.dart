import 'package:flapkap/models/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class SubscriberChart extends StatelessWidget {
 final List<charts.Series<ChartModel,String>> series ;

 SubscriberChart({required this.series});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: charts.BarChart(
        series ,
        animate: true,

      ),
    );
  }
}
