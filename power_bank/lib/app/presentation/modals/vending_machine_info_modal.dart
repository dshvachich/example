import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/buttons/base_button.dart';
import 'package:power_bank/core/ui/scroll_behavior/disable_glow_effect_scroll_behavior.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';
import 'package:power_bank/gen/assets.gen.dart';
import 'package:power_bank/localization/app_localizations.dart';

class VendingMachineInfoModal extends StatelessWidget {
  VendingMachineInfoModal({
    required this.vendingMachine,
    required this.rentPressed,
    required this.controller,
    required this.haveActiveRent,
  });

  final VendingMachine vendingMachine;
  final VoidCallback rentPressed;
  final ScrollController controller;
  final bool haveActiveRent;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 20,
              spreadRadius: 0,
              color: AppColors.cardShadow,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ScrollConfiguration(
          behavior: const DisableGrowEffectScrollBehavior(),
          child: CustomScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    if (Platform.isIOS)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: _buildDivider(),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: _buildTitle(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: _buildAddress(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: _buildStatusesSection(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: _buildTariffsSection(),
                    ),
                    Spacer(),
                    if (!haveActiveRent)
                      Padding(
                        padding: EdgeInsets.only(top: 28, bottom: 16 + MediaQuery.of(context).viewPadding.bottom),
                        child: _buildRentButton(context),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildDivider() => Container(
        height: 3,
        width: 40,
        color: AppColors.gray,
      );

  Widget _buildTitle(BuildContext context) => Text(
        AppLocalizations.of(context).vendingMachineGetPower,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 21,
          color: AppColors.onSurface1,
        ),
      );

  Widget _buildAddress(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          vendingMachine.address,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: AppColors.onSurface1,
          ),
        ),
      );

  Widget _buildStatusesSection(BuildContext context) => Row(
        children: [
          Spacer(flex: 2),
          _buildGetStatus(context),
          Spacer(flex: 3),
          _buildHangOverStatus(context),
          Spacer(flex: 2),
        ],
      );

  Widget _buildGetStatus(BuildContext context) => Column(
        children: [
          Stack(
            children: [
              Container(
                height: 72,
                width: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: _getAvailable ? AppColors.green : AppColors.gray2, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  vendingMachine.availableProductCount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: AppColors.onSurface1,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    _getAvailable ? Assets.images.getStatusEnabled.path : Assets.images.getStatusDisabled.path,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              AppLocalizations.of(context).canBeTaken,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurface1,
              ),
            ),
          ),
        ],
      );

  Widget _buildHangOverStatus(BuildContext context) => Column(
        children: [
          Stack(
            children: [
              Container(
                height: 72,
                width: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: _hangOverAvailable ? AppColors.green : AppColors.gray2, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  vendingMachine.freePlacesCount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: AppColors.onSurface1,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    _hangOverAvailable
                        ? Assets.images.hangOverStatusEnabled.path
                        : Assets.images.hangOverStatusDisabled.path,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              AppLocalizations.of(context).canBeHandedOver,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurface1,
              ),
            ),
          ),
        ],
      );

  Widget _buildTariffsSection() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.gray3,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: SvgPicture.asset(Assets.images.stock, width: 20, height: 20),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                    vendingMachine.tariff.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          vendingMachine.tariff[index].description.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 16 / 15,
                            color: AppColors.onSurface1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildRentButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BaseButton(
          text: _getAvailable ? AppLocalizations.of(context).rent : AppLocalizations.of(context).chooseAnotherOption,
          enabled: _getAvailable,
          onPressed: () {
            rentPressed();
          },
        ),
      );

  bool get _getAvailable => vendingMachine.availableProductCount > 0;

  bool get _hangOverAvailable => vendingMachine.freePlacesCount > 0;
}
