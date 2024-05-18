class AttendanceChartData {
  final String x;
  final int absents;
  final int lates;
  final int onTime;

  AttendanceChartData({
    required this.x,
    required this.lates,
    required this.onTime,
    required this.absents,
  });
}
