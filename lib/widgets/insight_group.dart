import 'package:eazio/widgets/insight_item.dart';
import 'package:eazio/widgets/insight_title.dart';
import 'package:flutter/material.dart';

class InsightGroup extends StatelessWidget {
  const InsightGroup(
      {super.key,
      required this.insightTitle,
      required this.firstInsightItem,
      required this.secondInsightItem});

  final InsightTitle insightTitle;
  final InsightItem firstInsightItem;
  final InsightItem secondInsightItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        insightTitle,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: firstInsightItem),
            Flexible(child: secondInsightItem),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
