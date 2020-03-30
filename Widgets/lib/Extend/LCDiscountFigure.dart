import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LCDiscountFigure extends StatefulWidget {
  LCDiscountFigure({Key key}) : super(key: key);

  @override
  _LCDiscountFigureState createState() => _LCDiscountFigureState();
}

class _LCDiscountFigureState extends State<LCDiscountFigure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chart")),
      body: ListView(children: [
        Container(
          height: 300,
          child: getBarChart(),
        ),
        Container(
          height: 300,
          child: getTimeSeriesChart(),
        ),
        Container(
          height: 300,
          child: getLineChart(),
        ),
        Container(
          height: 300,
          child: getLineChart2(),
        ),
        Container(
          height: 300,
          child: getPieChart(),
        ),
        Container(
          height: 300,
          child: getScatterPlotChart(),
        ),
        Container(
          height: 300,
          child: getBarChart2(),
        ),
      ]),
    );
  }

  //柱状图
  Widget getBarChart() {
    List<Barsales> dataBar = [
      new Barsales("1", 20),
      new Barsales("2", 50),
      new Barsales("3", 20),
      new Barsales("4", 80),
      new Barsales("5", 120),
      new Barsales("6", 30),
    ];

    var seriesBar = [
      charts.Series(
        data: dataBar,
        domainFn: (Barsales sales, _) => sales.day,
        measureFn: (Barsales sales, _) => sales.sale,
        id: "Sales",
      )
    ];
    return charts.BarChart(seriesBar);
  }

  //时间折线图
  Widget getTimeSeriesChart() {
    List<Linesales> dataLine = [
      new Linesales(new DateTime(2019, 7, 2), 33),
      new Linesales(new DateTime(2019, 7, 3), 55),
      new Linesales(new DateTime(2019, 7, 4), 22),
      new Linesales(new DateTime(2019, 7, 5), 88),
      new Linesales(new DateTime(2019, 7, 6), 123),
      new Linesales(new DateTime(2019, 7, 7), 75),
    ];

    var seriesLine = [
      charts.Series<Linesales, DateTime>(
        data: dataLine,
        domainFn: (Linesales lines, _) => lines.time,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines",
      )
    ];
    //是TimeSeriesChart，而不是LineChart,因为x轴是DataTime类
    Widget line = charts.TimeSeriesChart(seriesLine);
    return line;
  }

  //折线图
  Widget getLineChart() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    var seriesBar = [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
    return charts.LineChart(seriesBar);
  }

  //多数据折线图
  Widget getLineChart2() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    var myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    var myFakeMobileData = [
      new LinearSales(0, 15),
      new LinearSales(1, 75),
      new LinearSales(2, 300),
      new LinearSales(3, 225),
    ];

    var seriesBar = [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      )
    ];
    return charts.LineChart(seriesBar);
  }

  //饼状图
  Widget getPieChart() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    var seriesBar = [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        // colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
    return charts.PieChart(seriesBar);
  }

  //银光棒图
  Widget getScatterPlotChart() {
    final data = [
      new LinearSaless(10, 7, 10, 25, 20, 25, 5.0),
      new LinearSaless(13, 11, 13, 225, 205, 225, 5.0),
      new LinearSaless(34, 34, 24, 150, 150, 130, 5.0),
      new LinearSaless(37, 37, 57, 10, 10, 12, 6.5),
      new LinearSaless(45, 35, 45, 260, 300, 260, 8.0),
      new LinearSaless(56, 46, 56, 200, 170, 200, 7.0),
    ];

    final maxMeasure = 300;

    var seriesBar = [
      charts.Series<LinearSaless, int>(
        id: 'Sales',
        // Providing a color function is optional.
        colorFn: (LinearSaless sales, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;

          if (bucket < 1 / 3) {
            return MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return MaterialPalette.red.shadeDefault;
          } else {
            return MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSaless sales, _) => sales.year,
        domainLowerBoundFn: (LinearSaless sales, _) => sales.yearLower,
        domainUpperBoundFn: (LinearSaless sales, _) => sales.yearUpper,
        measureFn: (LinearSaless sales, _) => sales.sales,
        measureLowerBoundFn: (LinearSaless sales, _) => sales.salesLower,
        measureUpperBoundFn: (LinearSaless sales, _) => sales.salesUpper,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSaless sales, _) => sales.radius,
        data: data,
      )
    ];
    return charts.ScatterPlotChart(seriesBar,
        defaultRenderer: new charts.PointRendererConfig(
          pointRendererDecorators: [
            new charts.ComparisonPointsDecorator(
              symbolRenderer: new charts.CylinderSymbolRenderer(),
            ),
          ],
        ));
  }

  //饼状图
  Widget getBarChart2() {
    final desktopSalesDataA = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesDataA = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesDataA = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    final desktopSalesDataB = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesDataB = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesDataB = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    var seriesBar = [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Desktop B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataB,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataB,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataB,
      )
    ];
    return charts.BarChart(
      seriesBar,
      barGroupingType: charts.BarGroupingType.groupedStacked,
      behaviors: [
        new charts.SeriesLegend(
            position: charts.BehaviorPosition.end, desiredMaxRows: 6),
      ],
    );
  }
}

class Barsales {
  String day;
  int sale;
  Barsales(this.day, this.sale);
}

class Linesales {
  DateTime time;
  int sale;
  Linesales(this.time, this.sale);
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

/// Sample linear data type.
class LinearSaless {
  final int year;
  final int yearLower;
  final int yearUpper;
  final int sales;
  final int salesLower;
  final int salesUpper;
  final double radius;

  LinearSaless(this.year, this.yearLower, this.yearUpper, this.sales,
      this.salesLower, this.salesUpper, this.radius);
}
