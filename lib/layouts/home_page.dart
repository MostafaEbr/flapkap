

import 'package:flapkap/components/widgets/default_text.dart';
import 'package:flapkap/components/widgets/row_container.dart';
import 'package:flapkap/core/home_page_core.dart';
import 'package:flapkap/layouts/chart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCore>(
      init: HomePageCore(),
      builder: (homePage) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title:DefaultText(
            text: "FlapKap",
            textColor: Colors.red,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 50,
                  child: TextButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChartView(series: homePage.series,),));
                  }, child: DefaultText(
                    text: "Graph",
                    textColor: Colors.red,
                    textSize: 18,
                  )),
                ),
                RowContainer(
                  text:  " Total count",
                  text1: " Average price",
                  text2: "N of returns",
                  textSize: 18,
                  textColor: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),

                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: homePage.listOrders.length,
                    itemBuilder:(context, index) {
                    return RowContainer(
                      text:  "${homePage.listOrders.length}",
                      text1: "${double.parse(homePage.listOrders[index].price!.substring(1).replaceAll(",",""))/2 }",
                      text2: "${homePage.returned}",
                      textSize: 16,
                    );
                  },),
                )
              ],
            ),
          ),
        ),
      );
    },);



  }
}
