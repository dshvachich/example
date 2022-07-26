import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/gen/assets.gen.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  BaseAppBar({
    this.title,
    this.needLeadingButton = true,
    this.leadingButton,
    this.leadingButtonPressed,
    this.elevation = 0,
    this.sizeFromHeight = 56,
  });

  final String? title;
  final bool needLeadingButton;
  final Widget? leadingButton;
  final VoidCallback? leadingButtonPressed;
  final double elevation;
  final double sizeFromHeight;

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(sizeFromHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: Platform.isIOS ? true : false,
        title: widget.title != null ? Text(widget.title!) : null,
        leading: widget.leadingButton != null
            ? GestureDetector(
                onTap: () {
                  widget.leadingButtonPressed?.call();
                },
                child: widget.leadingButton,
              )
            : _buildBackButton(context),
        elevation: widget.elevation,
      );

  Widget _buildBackButton(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (widget.leadingButtonPressed != null) {
            widget.leadingButtonPressed?.call();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: SvgPicture.asset(
            Assets.images.backButton,
            width: 32,
            height: 32,
          ),
        ),
      );
}
