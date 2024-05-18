import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key,
      required this.labels,
      required this.selectedIndex,
      this.onValueChanged});

  final List<String> labels;
  final int selectedIndex;
  final void Function(int)? onValueChanged;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final tabsMap = <int, Widget>{};
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    _loadCupertinoTabs();
  }

  void _loadCupertinoTabs() {
    for (var i = 0; i < widget.labels.length; i++) {
      tabsMap.putIfAbsent(
        i,
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Text(
            widget.labels[i],
          ),
        ),
      );
    }
  }

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
      isSelected: List.generate(
          widget.labels.length, (index) => index == selectedIndex),
      onPressed: (int index) {
        widget.onValueChanged?.call(index);
        setState(() {
          selectedIndex = index;
        });
      },
      children: widget.labels
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
