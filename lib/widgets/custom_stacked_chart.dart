import 'package:eazio/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomStackedChart extends StatelessWidget {
  const CustomStackedChart({super.key, required this.chartData});

  final List<AttendanceChartData> chartData;

  List<StackedColumnSeries<AttendanceChartData, String>>
      _getStackedColumnSeries() {
    return <StackedColumnSeries<AttendanceChartData, String>>[
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.onTime,
        name: 'On-Time',
        color: Colors.green,
        width: .5,
        borderRadius: BorderRadius.circular(10),
        legendIconType: LegendIconType.circle,
      ),
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.lates,
        name: 'Late',
        color: Colors.orange,
        width: .5,
        borderRadius: BorderRadius.circular(10),
        legendIconType: LegendIconType.circle,
      ),
      StackedColumnSeries<AttendanceChartData, String>(
        dataSource: chartData,
        xValueMapper: (AttendanceChartData attendance, _) => attendance.x,
        yValueMapper: (AttendanceChartData attendance, _) => attendance.absents,
        name: 'Absents',
        color: Colors.red,
        width: .5,
        borderRadius: BorderRadius.circular(10),
        legendIconType: LegendIconType.circle,
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
        textStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        title: AxisTitle(
          text: 'This Week',
          textStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          title: AxisTitle(
            text: 'Attendance',
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
          labelFormat: '{value}',
          maximum: 1000,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
      tooltipBehavior: TooltipBehavior(),
    );
  }
}
