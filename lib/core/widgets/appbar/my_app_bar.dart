import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_task_manager_app/core/extentions/build_context_extension.dart';
import 'package:simple_task_manager_app/core/widgets/image/app_image.dart';
import 'package:simple_task_manager_app/gen/assets.gen.dart';
part 'default_app_bar.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget _child;
  final double? toolbarHeight;

  MyAppbar({
    super.key,
    final Widget? leading,
    final bool automaticallyImplyLeading = true,
    final Widget? title,
    final List<Widget>? actions,
    final Widget? flexibleSpace,
    final PreferredSizeWidget? bottom,
    final double? elevation,
    final double? scrolledUnderElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
    final ShapeBorder? shape,
    final Color? backgroundColor,
    final Color? foregroundColor,
    final IconThemeData? iconTheme,
    final IconThemeData? actionsIconTheme,
    final bool? centerTitle,
    final double? titleSpacing,
    final double? leadingWidth,
    final TextStyle? toolbarTextStyle,
    final TextStyle? titleTextStyle,
    final SystemUiOverlayStyle? systemOverlayStyle,
    final Clip? clipBehavior,
    this.toolbarHeight,
  }) : _child = _DefaultAppbar(
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          scrolledUnderElevation: scrolledUnderElevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
          clipBehavior: clipBehavior,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(toolbarHeight ?? kToolbarHeight);
  }
}
