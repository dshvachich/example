import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:power_bank/app/resources/app_colors.dart';

class BaseButton extends StatelessWidget {
  BaseButton({
    this.text,
    this.onPressed,
    this.enabled = true,
    this.color,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17,
      color: AppColors.onAccent1,
    ),
    this.borderColor,
    this.prefixImage,
    this.height = 48,
    this.width = double.maxFinite,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
    this.borderRadius = const BorderRadius.all(const Radius.circular(14)),
    this.elevation = 0,
    this.isLoading = false,
  });

  final String? text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? color;
  final TextStyle textStyle;
  final Color? borderColor;
  final Widget? prefixImage;
  final double height;
  final double width;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double elevation;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => ScaleTap(
        duration: Duration(milliseconds: 300),
        onPressed: () {
          if (enabled) {
            onPressed?.call();
          }
        },
        child: Material(
          borderRadius: borderRadius,
          elevation: elevation,
          child: SizedBox(
            height: height,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: borderColor != null ? Border.all(color: borderColor!) : null,
                color: color ?? (enabled ? AppColors.accent1 : AppColors.inactive),
              ),
              height: height,
              padding: padding,
              width: width,
              child: text != null
                  ? isLoading
                      ? Center(
                          child: _buildLoader(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (prefixImage != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: prefixImage,
                              ),
                            AutoSizeText(
                              text!,
                              textAlign: TextAlign.center,
                              style: enabled ? textStyle : textStyle.copyWith(color: AppColors.onInactive),
                            ),
                          ],
                        )
                  : const SizedBox(),
            ),
          ),
        ),
      );

  Widget _buildLoader() => Platform.isAndroid
      ? SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            color: AppColors.onAccent1,
          ),
        )
      : CupertinoActivityIndicator(
          radius: 11,
          color: AppColors.onAccent1,
        );
}
