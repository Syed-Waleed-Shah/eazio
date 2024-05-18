import 'package:eazio/models/time.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key, required this.time});
  final Time time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (time.hours != null) ...[
          _TimePart(value: time.hours!, label: 'Hr'),
          const SizedBox(width: 4),
        ],
        _TimePart(value: time.minutes, label: 'Min'),
      ],
    );
  }
}

class _TimePart extends StatelessWidget {
  const _TimePart({required this.value, required this.label});
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$value ',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
        children: [
          TextSpan(
            text: label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
