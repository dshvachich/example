import 'package:flutter/cupertino.dart';
import 'package:power_bank/app/resources/app_colors.dart';

class MenuButton extends StatelessWidget {
  MenuButton({
    this.size = 40,
    this.onPressed,
  });

  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: size,
          width: size,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 11),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 12,
                spreadRadius: 0,
                color: AppColors.buttonShadow,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLine(),
              const SizedBox(height: 3),
              _buildLine(),
              const SizedBox(height: 3),
              _buildLine(width: 9),
            ],
          ),
        ),
      );

  Widget _buildLine({double width = 18}) => Container(
        color: AppColors.onBackground11,
        width: width,
        height: 2,
      );
}
