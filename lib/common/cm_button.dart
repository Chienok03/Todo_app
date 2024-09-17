import 'package:flutter/material.dart';

class CmButton extends StatelessWidget {
  final Widget title;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final void Function() onTap;
  final Color? colorBorder;

  const CmButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.backgroundColor,
      this.colorBorder,
      this.height = 48,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
            border:
                Border.all(color: colorBorder ?? Colors.transparent, width: 2),
          ),
          child: title),
    );
  }
}
