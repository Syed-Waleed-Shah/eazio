import 'package:eazio/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomStackedChart extends StatelessWidget {
  const CustomStackedChart(
      {super.key, required this.chartData, required this.label});

  final List<AttendanceChartData> chartData;
  final String label;

  List<StackedColumnSeries<AttendanceChartData, String>>
      _getStackedColumnSeries() {
    LegendIconType legendIconType = LegendIconType.circle;
    double width = 0.5;
    return <StackedColumnSeries<AttendanceChartData, String>>[
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.onTime,
        name: 'On-Time',
        color: Colors.green,
        width: width,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        legendIconType: legendIconType,
      ),
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.lates,
        name: 'Late',
        color: Colors.orange,
        width: width,
        legendIconType: legendIconType,
      ),
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.absents,
        name: 'Absents',
        color: Colors.red,
        width: width,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        legendIconType: legendIconType,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(
        isVisible: true,
        iconHeight: 8,
        iconWidth: 8,
        alignment: ChartAlignment.far,
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
            ),
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        title: AxisTitle(
          text: label,
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          title: AxisTitle(
            text: 'Attendance',
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          labelFormat: '{value}',
          maximum: 1000,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
      tooltipBehavior: TooltipBehavior(),
    );
  }
}
