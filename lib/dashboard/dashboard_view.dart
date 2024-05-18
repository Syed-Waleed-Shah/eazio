import 'package:eazio/dashboard/dashboard_controller.dart';
import 'package:eazio/models/growth.dart';
import 'package:eazio/models/money.dart';
import 'package:eazio/models/time.dart';
import 'package:eazio/widgets/custom_button.dart';
import 'package:eazio/widgets/custom_icon_button.dart';
import 'package:eazio/widgets/custom_stacked_chart.dart';
import 'package:eazio/widgets/custom_tab_bar.dart';
import 'package:eazio/widgets/insight_group.dart';
import 'package:eazio/widgets/insight_item.dart';
import 'package:eazio/widgets/insight_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'assets/icons/logo.png',
                width: 130,
              ),
              actions: const [
                CustomIconButton(asset: 'assets/icons/bell.png'),
                CustomIconButton(asset: 'assets/icons/message.png'),
                CustomIconButton(asset: 'assets/icons/menu.png'),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Organization Insights.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Track Your Organization Stats Insights',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: 'Manage Widgets',
                    icon: 'assets/icons/plus.png',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        alignment: Alignment.topRight,
                        image: AssetImage('assets/icons/pattern.png'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Back, John!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Take A Look at Our Weekly Reports.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                              CustomIconButton(
                                asset: 'assets/icons/share.png',
                                backgroundColor: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InsightGroup(
                                insightTitle: const InsightTitle(
                                  title: 'Average Late & Overtime',
                                ),
                                firstInsightItem: InsightItem(
                                  label: 'Avg. Lateness',
                                  time: Time(minutes: 25),
                                  growth: Growth(
                                    value: 15,
                                    isPositive: false,
                                  ),
                                ),
                                secondInsightItem: InsightItem(
                                  label: 'Avg. Overtime',
                                  time: Time(hours: 5, minutes: 15),
                                  growth: Growth(
                                    value: 15,
                                  ),
                                ),
                              ),
                              InsightGroup(
                                insightTitle: const InsightTitle(
                                  title: 'Payroll Finance',
                                ),
                                firstInsightItem: InsightItem(
                                  label: 'Total Processed',
                                  money: Money(
                                      currencyCode: 'AED', amount: '43.20K'),
                                  growth: Growth(
                                    value: 15,
                                  ),
                                ),
                                secondInsightItem: InsightItem(
                                  label: 'Avg. Overtime',
                                  money: Money(
                                      currencyCode: 'AED', amount: '105.40K'),
                                  growth: Growth(
                                    value: 15,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Flexible(
                                    child: InsightGroup(
                                      insightTitle: InsightTitle(
                                        title: 'Activity',
                                      ),
                                      firstInsightItem: InsightItem(
                                        label: 'Avg. Leaves',
                                        quantity: 22,
                                      ),
                                      secondInsightItem: InsightItem(
                                        label: 'Avg. Attendance',
                                        quantity: 70,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 60),
                                  Flexible(
                                    child: InsightGroup(
                                      insightTitle: InsightTitle(
                                        title: 'Head Count',
                                      ),
                                      firstInsightItem: InsightItem(
                                        label: 'Total Employees',
                                        quantity: 1283,
                                      ),
                                      secondInsightItem: InsightItem(
                                        label: 'Total Internship',
                                        quantity: 250,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Attendance Summary',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Icon(
                                    Icons.more_vert_rounded,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return CustomTabBar(
                            labels: const ['Today', 'This Week', 'This Month'],
                            selectedIndex: controller
                                .attendanceSummaryTabSelectedIndex.value,
                            onValueChanged: controller.changeAttendanceSummary,
                          );
                        }),
                        const Divider(),
                        Obx(() {
                          return CustomStackedChart(
                            chartData: controller.currentChartData.value,
                            label: controller.currentChartLabel.value,
                          );
                        }),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                label: 'Learn more',
                                showBorder: false,
                                onTap: () {},
                              ),
                              CustomButton(
                                label: 'View full report',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
