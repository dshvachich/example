import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/buttons/base_button.dart';
import 'package:power_bank/app/widgets/inputs/code_input.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_listener.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/core/utils/duration_extensions.dart';
import 'package:power_bank/gen/assets.gen.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'bloc/confirm_phone_bloc.dart';

class ConfirmPhoneScreen extends StatefulWidget {
  @override
  State<ConfirmPhoneScreen> createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends BaseBlocStateWidget<ConfirmPhoneScreen, ConfirmPhoneBloc, ConfirmPhoneEvent>
    with CodeAutoFill {
  static const Duration _animationDuration = const Duration(milliseconds: 250);

  @override
  void codeUpdated() {
    if (code != null) {
      sendEvent(ConfirmPhoneEvent.codeChanged(code!));
    }
  }

  @override
  void initState() {
    listenForCode();
    super.initState();
  }

  @override
  void dispose() {
    cancel();
    unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background1,
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<ConfirmPhoneBloc, ConfirmPhoneState>(
        child: Column(
          children: [
            _buildHeader(),
            AnimatedPadding(
              duration: _animationDuration,
              padding: EdgeInsets.only(top: (mediaQuery.size.height - mediaQuery.viewInsets.bottom) * 0.1),
              child: _buildInfoSection(),
            ),
            AnimatedPadding(
              duration: _animationDuration,
              padding: EdgeInsets.only(top: (mediaQuery.size.height - mediaQuery.viewInsets.bottom) * 0.095),
              child: _buildCodeInput(),
            ),
            Spacer(),
            _buildButton(),
          ],
        ),
      );

  Widget _buildHeader() => Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: _buildBackButton(),
          ),
          Positioned.fill(
            child: Center(
              child: _buildLogo(),
            ),
          ),
        ],
      );

  Widget _buildBackButton() => GestureDetector(
        onTap: () {
          sendEvent(ConfirmPhoneEvent.backClicked());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SvgPicture.asset(
            Assets.images.backButton,
            height: 32,
            width: 32,
          ),
        ),
      );

  Widget _buildLogo() => AnimatedOpacity(
        opacity: 1.0,
        duration: _animationDuration,
        child: SvgPicture.asset(
          Assets.images.appLogo,
          color: AppColors.accent1,
          height: 32,
          width: 32,
        ),
      );

  Widget _buildInfoSection() => Column(
        children: [
          _buildTitle(),
          _buildDescription(),
        ],
      );

  Widget _buildTitle() => Text(
        localization.enterCode,
        style: TextStyle(
          color: AppColors.onBackground11,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _buildDescription() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          localization.authorizationDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.onBackground11,
            fontSize: 17,
            height: 24 / 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  Widget _buildCodeInput() => BlocBuilder<ConfirmPhoneBloc, ConfirmPhoneState>(
        buildWhen: (previous, current) => previous.code != current.code,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CodeInput(
              code: state.code,
              onChanged: (code) {
                sendEvent(ConfirmPhoneEvent.codeChanged(code));
              },
            ),
          );
        },
      );

  Widget _buildButton() => BlocBuilder<ConfirmPhoneBloc, ConfirmPhoneState>(
        buildWhen: (previous, current) =>
            previous.code != current.code ||
            previous.buttonEnabled != current.buttonEnabled ||
            previous.isLoading != current.isLoading ||
            previous.countOfSecondsToResend != current.countOfSecondsToResend,
        builder: (context, state) {
          String text;
          if ((state.code?.length ?? 0) >= 5) {
            text = localization.enter;
          } else {
            if (state.countOfSecondsToResend > 0) {
              text = localization.resendCodeAfter(Duration(seconds: state.countOfSecondsToResend).getTimeString());
            } else {
              text = localization.sendCode;
            }
          }
          return AnimatedOpacity(
            opacity: 1.0,
            duration: _animationDuration,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: BaseButton(
                text: text,
                isLoading: state.isLoading,
                enabled: state.buttonEnabled,
                onPressed: () {
                  if ((state.code?.length ?? 0) >= 5) {
                    sendEvent(ConfirmPhoneEvent.enterClicked());
                  } else {
                    sendEvent(ConfirmPhoneEvent.resendCodeClicked());
                  }
                },
              ),
            ),
          );
        },
      );
}
