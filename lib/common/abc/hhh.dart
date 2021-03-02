// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:charts_flutter/flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class RTLLineChart extends StatelessWidget {
//   final List<Series> seriesList;
//   final bool animate;
//
//   RTLLineChart(this.seriesList, {this.animate});
//
//   /// Creates a [LineChart] with sample data and no transition.
//   factory RTLLineChart.withSampleData() {
//     return new RTLLineChart(
//       createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Charts will determine if RTL is enabled by checking the directionality by
//     // requesting Directionality.of(context). This returns the text direction
//     // from the closest instance of that encloses the context passed to build
//     // the chart. A [TextDirection.rtl] will be treated as a RTL chart. This
//     // means that the directionality widget does not have to directly wrap each
//     // chart. It is show here as an example only.
//     //
//     // By default, when a chart detects RTL:
//     // Measure axis positions are flipped. Primary measure axis is on the right
//     // and the secondary measure axis is on the left (when used).
//     // Domain axis' first domain starts on the right and grows left.
//     return  LineChart(
//
//           seriesList,
//
//           animate: animate,
//         );
//   }
//
//   /// Create one series with sample hard coded data.
//   static List<Series<LinearSales, int>> createSampleData() {
//     final data = [
//       new LinearSales(0, 5),
//       new LinearSales(1, 66),
//       new LinearSales(2, 78),
//       new LinearSales(3, 9),
//     ];
//
//     return [
//       new charts.Series<LinearSales, int>(
//         id: 'Sales',
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }
//
// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;
//
//   LinearSales(this.year, this.sales);
// }