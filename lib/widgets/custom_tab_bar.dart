import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      required this.labels,
      required this.selectedIndex,
      this.onValueChanged});

  final List<String> labels;
  final int selectedIndex;
  final void Function(int)? onValueChanged;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: Colors.orange.shade50,
      selectedColor: Colors.orange,
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
      color: Colors.black,
      splashColor: Colors.orange.shade50,
      borderRadius: BorderRadius.circular(12),
      isSelected:
          List.generate(labels.length, (index) => index == selectedIndex),
      onPressed: (int index) {
        onValueChanged?.call(index);
      },
      children: labels
          .map<Widget>(
            (label) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(label),
            ),
          )
          .toList(),
    );
  }
}
