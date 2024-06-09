import 'package:flutter/material.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';

/// A custom card widget with customizable properties.
class MyCard extends StatelessWidget {
  final double? height, width;
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final Widget? child;
  final Function()? onTap;
  final Color? color;
  final BorderRadius borderRadius;
  final Color? shadowColor;

  /// The [height], [width], [decoration], [padding], [child], [onTap], [color],
  /// [borderRadius], and [shadowColor] parameters allow customization of the card.
  MyCard({
    super.key,
    this.height,
    this.width,
    final BoxDecoration? decoration,
    this.padding = EdgeInsets.zero,
    this.child,
    this.onTap,
    this.color,
    final BorderRadius? borderRadius,
    this.shadowColor,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(12.0),
        decoration = decoration ?? const BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        padding: padding,
        height: height,
        width: width,
        decoration: decoration.copyWith(
          borderRadius: borderRadius,
          color: color ?? context.cardColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? context.shadow.withOpacity(0.2),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset.zero,
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
