import 'package:eazio/data/chart_data.dart';
import 'package:eazio/models/chart_data.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt attendanceSummaryTabSelectedIndex = 1.obs;

  RxList<AttendanceChartData> currentChartData = <AttendanceChartData>[].obs;

  @override
  void onInit() {
    super.onInit();
    currentChartData.value = chartData[1] ?? [];
  }

  void changeAttendanceSummary(int index) {
    attendanceSummaryTabSelectedIndex.value = index;
    currentChartData.value = chartData[index] ?? [];
  }
}
