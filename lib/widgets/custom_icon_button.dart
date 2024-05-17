import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.asset,
    this.backgroundColor,
    this.borderRadius,
    this.shape,
    this.onTap,
  });
  final String asset;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          shape: shape ?? BoxShape.rectangle,
        ),
        child: Image.asset(
          asset,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
