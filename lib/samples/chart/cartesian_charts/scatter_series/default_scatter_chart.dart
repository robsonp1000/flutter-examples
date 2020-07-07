/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/model.dart';
import '../../../../model/sample_view.dart';

/// Renders the default scatter chart sample.
class ScatterDefault extends SampleView {
  const ScatterDefault(Key key) : super(key: key);

  @override
  _ScatterDefaultState createState() => _ScatterDefaultState();
}

/// State class of default scatter chart sample.
class _ScatterDefaultState extends SampleViewState {
  _ScatterDefaultState();

  @override
  Widget build(BuildContext context) {
    return getDefaultScatterChart();
  }

  /// Returns the default scatter chart.
  SfCartesianChart getDefaultScatterChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Export growth rate'),
      legend: Legend(isVisible: isCardView ? false : true),
      primaryXAxis: DateTimeAxis(
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: AxisLine(width: 0),
          minorTickLines: MinorTickLines(size: 0)),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: getDefaultScatterSeries(),
    );
  }

  /// Returns the list of chart series which need to render on the scatter chart.
  List<ScatterSeries<ChartSampleData, DateTime>> getDefaultScatterSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2006, 1, 1), y: 0.01, yValue: -0.03, yValue2: 0.10),
      ChartSampleData(
          x: DateTime(2007, 1, 1), y: 0.03, yValue: -0.02, yValue2: 0.08),
      ChartSampleData(
          x: DateTime(2008, 1, 1), y: -0.06, yValue: -0.13, yValue2: -0.03),
      ChartSampleData(
          x: DateTime(2009, 1, 1), y: -0.03, yValue: -0.04, yValue2: 0.04),
      ChartSampleData(
          x: DateTime(2010, 1, 1), y: 0.09, yValue: 0.07, yValue2: 0.19),
      ChartSampleData(x: DateTime(2011, 1, 1), y: 0, yValue: 0.04, yValue2: 0),
      ChartSampleData(
          x: DateTime(2012, 1, 1), y: 0.01, yValue: -0.01, yValue2: -0.09),
      ChartSampleData(
          x: DateTime(2013, 1, 1), y: 0.05, yValue: 0.05, yValue2: 0.10),
      ChartSampleData(
          x: DateTime(2014, 1, 1), y: 0, yValue: 0.08, yValue2: 0.05),
      ChartSampleData(
          x: DateTime(2015, 1, 1), y: 0.1, yValue: 0.01, yValue2: -0.04),
      ChartSampleData(
          x: DateTime(2016, 1, 1), y: 0.08, yValue: 0, yValue2: 0.02),
    ];
    return <ScatterSeries<ChartSampleData, DateTime>>[
      ScatterSeries<ChartSampleData, DateTime>(
          enableTooltip: true,
          dataSource: chartData,
          opacity: 0.7,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: MarkerSettings(height: 15, width: 15),
          name: 'Brazil'),
      ScatterSeries<ChartSampleData, DateTime>(
          enableTooltip: true,
          opacity: 0.7,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          markerSettings: MarkerSettings(height: 15, width: 15),
          name: 'Canada'),
      ScatterSeries<ChartSampleData, DateTime>(
        enableTooltip: true,
        dataSource: chartData,
        color: const Color.fromRGBO(0, 168, 181, 1),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.yValue2,
        name: 'India',
        markerSettings: MarkerSettings(height: 15, width: 15),
      )
    ];
  }
}