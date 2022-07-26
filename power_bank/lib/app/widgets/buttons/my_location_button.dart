import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/gen/assets.gen.dart';

class MyLocationButton extends StatelessWidget {
  MyLocationButton({
    this.size = 40,
    this.onPressed,
  });

  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => ScaleTap(
        duration: Duration(milliseconds: 300),
        onPressed: () {
          onPressed?.call();
        },
        child: Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 12,
                spreadRadius: 0,
                color: AppColors.buttonShadow,
              )
            ],
          ),
          child: SvgPicture.asset(Assets.images.location, width: 20, height: 20),
        ),
      );
}
