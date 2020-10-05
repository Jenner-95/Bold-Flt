import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWid extends StatefulWidget {
  @override
  _ChartWidState createState() => _ChartWidState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _ChartWidState extends State<ChartWid> {
  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('M', 12, Color(0xff9cc6e8)),
      ClicksPerYear('T', 32, Color(0xff9cc6e8)),
      ClicksPerYear('W', 20, Color(0xff9cc6e8)),
      ClicksPerYear('T ', 32, Color(0xff9cc6e8)),
      ClicksPerYear('F', 29, Color(0xff9cc6e8)),
      ClicksPerYear('S ', 30, Color(0xff9cc6e8)),
      ClicksPerYear('S', 22, Color(0xff9cc6e8)),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: false,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        chartWidget,
      ],
    );
  }
}
