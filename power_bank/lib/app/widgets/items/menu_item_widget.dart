import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/domain/enums/menu_item.dart' as enums;
import 'package:power_bank/gen/assets.gen.dart';
import 'package:power_bank/localization/app_localizations.dart';

class MenuItemWidget extends StatelessWidget {
  MenuItemWidget({
    required this.item,
    this.onPressed,
  });

  final enums.MenuItem item;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          onPressed?.call();
        },
        splashColor: AppColors.splashColor,
        highlightColor: AppColors.highlightColor,
        child: Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildName(context),
              Spacer(),
              if (item == enums.MenuItem.paymentMethods) _buildPaymentsMethods(),
              _buildArrow(),
            ],
          ),
        ),
      );

  Widget _buildName(BuildContext context) {
    String name = '';

    switch (item) {
      case enums.MenuItem.paymentMethods:
        name = AppLocalizations.of(context).paymentMethods;
        break;
      case enums.MenuItem.tariffs:
        name = AppLocalizations.of(context).tariffs;
        break;
      case enums.MenuItem.aboutService:
        name = AppLocalizations.of(context).aboutService;
        break;
      case enums.MenuItem.support:
        name = AppLocalizations.of(context).support;
        break;
    }
    return Padding(
      padding: EdgeInsets.only(left: 9, right: 30),
      child: Text(
        name,
        style: TextStyle(
          color: AppColors.onSurface1,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildArrow() => SvgPicture.asset(Assets.images.arrowRight, width: 24, height: 24);

  Widget _buildPaymentsMethods() => SizedBox();
}
