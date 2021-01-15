import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_covid_app_lab_1/model/covid19_week_model.dart';
import 'package:flutter_covid_app_lab_1/utils/data_util.dart';
class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withSampleData(Covid19WeekModel covid19weekModel) {
    final List<OrdinalSales> deathData = [];
    final List<OrdinalSales> confirmedData = [];
    final List<OrdinalSales> recoveredData = [];
    if (covid19weekModel != null) {
      covid19weekModel.data.forEach((key, value) {
        deathData.add(OrdinalSales(DateUtil.getWeekday(DateUtil.getDateTime(key)).substring(0,3), value["deaths"]));
        confirmedData.add(OrdinalSales(DateUtil.getWeekday(DateUtil.getDateTime(key)).substring(0,3), value["total_cases"]));
        recoveredData.add(OrdinalSales(DateUtil.getWeekday(DateUtil.getDateTime(key)).substring(0,3), value["recovered"]));
      });
    }
    while(deathData.length > 7){
      deathData.removeLast();
    }
    while(confirmedData.length > 7){
      confirmedData.removeLast();
    }
    while(recoveredData.length > 7){
      recoveredData.removeLast();
    }
    return new GroupedBarChart(
      _createSampleData(deathData.reversed.toList(), confirmedData.reversed.toList(), recoveredData.reversed.toList()),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [new charts.SeriesLegend()],
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(
      List<OrdinalSales> deathData, List<OrdinalSales> confirmedData, List<OrdinalSales> recoveredData) {
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'death',
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.people,
        data: deathData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'confirmed',
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.people,
        data: confirmedData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'recovered',
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.people,
        data: recoveredData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String day;
  final int people;

  OrdinalSales(this.day, this.people);
}
