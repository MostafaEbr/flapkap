

import 'package:flapkap/components/widgets/subscriber_chart.dart';
import 'package:flapkap/models/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class ChartView extends StatelessWidget {
  final List<charts.Series<ChartModel,String>> series ;

  ChartView({required this.series});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SubscriberChart(series: series,)
            ],
          ),
        ),
      ),
    );



  }
}
