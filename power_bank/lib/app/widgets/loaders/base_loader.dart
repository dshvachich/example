import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_bank/app/resources/app_colors.dart';

class BaseLoader extends StatefulWidget {
  BaseLoader({
    required this.size,
    this.color = AppColors.accent1,
  });

  final double size;
  final Color color;

  @override
  State<BaseLoader> createState() => _BaseLoaderState();
}

class _BaseLoaderState extends State<BaseLoader> {
  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? SizedBox(
          height: widget.size,
          width: widget.size,
          child: CircularProgressIndicator(color: widget.color),
        )
      : CupertinoActivityIndicator(radius: widget.size / 2, color: widget.color);
}
