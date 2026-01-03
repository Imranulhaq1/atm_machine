import 'package:flutter/material.dart';

class AtmButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? width;
  final double? height;

  const AtmButton(
      {super.key,
      this.text,
      this.icon,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.padding,
      this.elevation,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 2,
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        child: Container(
          width: width,
          height: height,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                if (text != null) const SizedBox(width: 8),
              ],
              if (text != null)
                Text(
                  text!,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
