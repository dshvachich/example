import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/gen/assets.gen.dart';
import 'package:power_bank/localization/app_localizations.dart';

class Profile extends StatelessWidget {
  const Profile({
    required this.phoneNumber,
    required this.onExitPressed,
  });

  final String phoneNumber;
  final VoidCallback onExitPressed;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: _buildImage(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPhone(),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: _buildExitButton(context),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildImage() => SvgPicture.asset(Assets.images.profile, height: 40, width: 40);

  Widget _buildPhone() => Text(
        phoneNumber,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: AppColors.onSurface1,
        ),
      );

  Widget _buildExitButton(BuildContext context) => GestureDetector(
        onTap: () {
          onExitPressed.call();
        },
        child: Text(
          AppLocalizations.of(context).exit,
          style: TextStyle(
            color: AppColors.onBackground12,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      );
}
