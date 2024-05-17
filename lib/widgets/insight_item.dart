import 'package:eazio/models/growth.dart';
import 'package:eazio/models/money.dart';
import 'package:eazio/models/time.dart';
import 'package:eazio/widgets/growth_widget.dart';
import 'package:eazio/widgets/money_widget.dart';
import 'package:eazio/widgets/quantity_widget.dart';
import 'package:eazio/widgets/time_widget.dart';
import 'package:flutter/material.dart';

class InsightItem extends StatelessWidget {
  const InsightItem({
    super.key,
    required this.label,
    this.growth,
    this.time,
    this.money,
    this.quantity,
  });

  final Time? time;
  final Money? money;
  final int? quantity;
  final String label;
  final Growth? growth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            if (time != null) {
              return TimeWidget(
                time: time!,
              );
            } else if (money != null) {
              return MoneyWidget(
                money: money!,
              );
            } else {
              return QuantityWidget(
                quantity: quantity!,
              );
            }
          },
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
        ),
        if (growth != null) GrowthWidget(growth: growth!),
      ],
    );
  }
}
