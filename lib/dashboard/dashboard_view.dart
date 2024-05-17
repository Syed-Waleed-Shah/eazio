import 'package:eazio/models/growth.dart';
import 'package:eazio/widgets/custom_button.dart';
import 'package:eazio/widgets/custom_icon_button.dart';
import 'package:eazio/widgets/insight_item.dart';
import 'package:eazio/widgets/insight_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/logo.png'),
        actions: const [
          CustomIconButton(asset: 'assets/icons/bell.png'),
          CustomIconButton(asset: 'assets/icons/message.png'),
          CustomIconButton(asset: 'assets/icons/menu.png'),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
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
            const SizedBox(height: 32),
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
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
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InsightTitle(
                          title: 'Average Late & Overtime',
                        ),
                        InsightTitle(
                          title: 'Payroll Finance',
                        ),
                        InsightItem(
                          label: 'Total Processed',
                          growth: Growth(
                            value: 15,
                            isPositive: false,
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: InsightTitle(
                                title: 'Activity',
                              ),
                            ),
                            SizedBox(width: 24),
                            Flexible(
                              child: InsightTitle(
                                title: 'Head Count',
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
          ],
        ),
      ),
    );
  }
}
