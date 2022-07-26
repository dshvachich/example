import 'package:flutter/cupertino.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/buttons/base_button.dart';

class MessageModal extends StatelessWidget {
  const MessageModal({
    required this.title,
    this.text,
    required this.mainButtonText,
    this.additionalButtonText,
    this.onMainButtonPressed,
    this.onAdditionalButtonPressed,
  });

  final String title;
  final String? text;
  final String mainButtonText;
  final String? additionalButtonText;
  final VoidCallback? onMainButtonPressed;
  final VoidCallback? onAdditionalButtonPressed;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(offset: const Offset(0, 8), color: AppColors.cardShadow, blurRadius: 20),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              if (text?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: _buildText(),
                ),
              const SizedBox(height: 24),
              if (additionalButtonText != null) _buildAdditionalButton(),
              _buildMainButton(context),
            ],
          ),
        ),
      );

  Widget _buildTitle() => Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: AppColors.onBackground11),
      );

  Widget _buildText() => Text(
        text!,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.onBackground11),
      );

  Widget _buildAdditionalButton() => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: BaseButton(
          text: additionalButtonText,
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: AppColors.onBackground11),
          color: AppColors.gray3,
          onPressed: onAdditionalButtonPressed,
        ),
      );

  Widget _buildMainButton(BuildContext context) => BaseButton(
        text: mainButtonText,
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.white),
        color: AppColors.accent1,
        onPressed: onMainButtonPressed ??
            () {
              Navigator.pop(context);
            },
      );
}
