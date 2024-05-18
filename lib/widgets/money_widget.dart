import 'package:eazio/models/money.dart';
import 'package:flutter/material.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({super.key, required this.money});
  final Money money;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${money.currencyCode} ${money.amount}',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
    );
  }
}
