import 'package:flutter/material.dart';

class InsightTitle extends StatelessWidget {
  const InsightTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 4),
        const Divider(),
      ],
    );
  }
}
