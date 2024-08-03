import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final Color color;
  final Widget text;
  final Size size;
  final void Function()? onTap;
  const CustomFormButton({
    required this.onTap,
    required this.color,
    required this.text,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
