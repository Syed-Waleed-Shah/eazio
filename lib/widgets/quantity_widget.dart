import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key, required this.quantity});
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Text(
      quantity.toString(),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
    );
  }
}
