import 'package:eazio/models/growth.dart';
import 'package:flutter/material.dart';

class GrowthWidget extends StatelessWidget {
  const GrowthWidget({super.key, required this.growth});
  final Growth growth;

  @override
  Widget build(BuildContext context) {
    final Color color = growth.isPositive ? Colors.green : Colors.red;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              growth.isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              '${growth.value}%',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
