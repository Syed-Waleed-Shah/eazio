import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.showBorder = true,
  });

  final String label;
  final String? icon;
  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(8.0);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 14.0,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: showBorder
              ? Border.all(
                  color: Colors.grey.shade300,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Image.asset(
                icon!,
                height: 16,
                width: 16,
              ),
              const SizedBox(width: 4),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}
