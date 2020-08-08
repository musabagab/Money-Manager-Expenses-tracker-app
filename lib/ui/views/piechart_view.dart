import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);
    return Scaffold(
      appBar: AppBar(
        title: Text('PieChart'),
      ),
      body: SafeArea(child: PieChart(dataMap: dataMap)),
    );
  }
}
