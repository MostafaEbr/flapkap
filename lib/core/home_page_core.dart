import 'package:flapkap/models/chart_model.dart';
import 'package:flapkap/models/order_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
class HomePageCore extends GetxController{

  String path = "assets/json/orders.json";
 List<Orders> listOrders =[];
 int returned =0 ;
 List<charts.Series<ChartModel,String>> series =[] ;
 List<ChartModel> chart =[];

@override
  void onInit() {

  readJson();

    super.onInit();
  }


  readJson() async {

  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
      for(int i= 0 ; i < data.length ; i++)
        {
          listOrders.add(Orders.fromJson(data[i]));
          if(data[i]["status"]=="RETURNED")
            {
              returned++;
            }
        }

     await getOrderChart(listOrders);
  update();
}

  getOrderChart(List<Orders> listOrders) async{
    var data;


  for(int i = 0 ; i<listOrders.length;i++) {
    data = listOrders[i].registered!.substring(
        listOrders[i].registered!.indexOf("T") + 1,
        listOrders[i].registered!.indexOf(" "));
    chart.add(ChartModel(num_of_order: listOrders.length, time: data));
  }



  series.add(charts.Series(
    data: chart,
    id: "2021",
    domainFn: (ChartModel chartModel, _) => chartModel.time,
    measureFn: (ChartModel chartModel, _) => chartModel.num_of_order,
  ));

    print(series);
  update();
  }

}