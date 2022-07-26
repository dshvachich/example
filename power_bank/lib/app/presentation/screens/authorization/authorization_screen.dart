import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/presentation/screens/authorization/bloc/authorization_bloc.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/buttons/base_button.dart';
import 'package:power_bank/app/widgets/inputs/phone_input.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_listener.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/core/validation/phone.dart';
import 'package:power_bank/gen/assets.gen.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState
    extends BaseBlocStateWidget<AuthorizationScreen, AuthorizationBloc, AuthorizationEvent> {
  late FocusNode _focusNode;
  late void Function() _focusListener;

  static const Duration _animationDuration = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusListener = () {
      if (_focusNode.hasFocus) {
        sendEvent(AuthorizationEvent.startNumberEntering());
      } else {
        sendEvent(AuthorizationEvent.endNumberEntering());
      }
    };
    _focusNode.addListener(_focusListener);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_focusListener);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background1,
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<AuthorizationBloc, AuthorizationState>(
        listener: (context, state, action) async {
          if (action is HideKeyboard) {
            _focusNode.unfocus();
          }
        },
        child: Column(
          children: [
            _buildInfoSection(),
            const SizedBox(height: 45),
            _buildPhoneInput(),
            Spacer(),
            _buildFooterSection(),
          ],
        ),
      );

  Widget _buildInfoSection() => Column(
        children: [
          _buildLogo(),
          _buildTitle(),
          _buildDescription(),
        ],
      );

  Widget _buildLogo() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) => previous.numberEntering != current.numberEntering,
        builder: (context, state) => Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: _buildBackButton(),
            ),
            AnimatedContainer(
              duration: _animationDuration,
              alignment: state.numberEntering ? Alignment.topCenter : Alignment.bottomCenter,
              padding: state.numberEntering ? EdgeInsets.only(bottom: 0, top: 12) : EdgeInsets.only(bottom: 20),
              height: state.numberEntering ? mediaQuery.size.height * 0.12 : mediaQuery.size.height * 0.22,
              child: AnimatedContainer(
                duration: _animationDuration,
                height: state.numberEntering ? 32 : 64,
                width: state.numberEntering ? 32 : 64,
                child: SvgPicture.asset(
                  Assets.images.appLogo,
                  color: AppColors.accent1,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildTitle() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) => previous.numberEntering != current.numberEntering,
        builder: (context, state) {
          String title = state.numberEntering ? localization.enterNumber : localization.appTitle;

          return AnimatedPadding(
            padding: EdgeInsets.only(bottom: state.numberEntering ? 8 : 24),
            duration: _animationDuration,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.onBackground11,
                fontSize: state.numberEntering ? 24 : 28,
                fontWeight: state.numberEntering ? FontWeight.w600 : FontWeight.w700,
              ),
            ),
          );
        },
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

  Widget _buildBackButton() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) => previous.numberEntering != current.numberEntering,
        builder: (context, state) => AnimatedOpacity(
          opacity: state.numberEntering ? 1.0 : 0.0,
          duration: _animationDuration,
          child: GestureDetector(
            onTap: () {
              sendEvent(AuthorizationEvent.backClicked());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SvgPicture.asset(
                Assets.images.backButton,
                height: 32,
                width: 32,
              ),
            ),
          ),
        ),
      );

  Widget _buildPhoneInput() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          String? error;

          switch (state.phone.error) {
            case PhoneValidationError.empty:
              error = localization.needFillPhoneNumber;
              break;
            case PhoneValidationError.invalid:
              error = localization.youEnteredIncorrectPhoneNumber;
              break;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PhoneInput(
              phone: state.phone.value,
              error: error,
              focusNode: _focusNode,
              onChanged: (phone) {
                sendEvent(AuthorizationEvent.phoneChanged(phone));
              },
            ),
          );
        },
      );

  Widget _buildSendCodeButton() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) =>
            previous.numberEntering != current.numberEntering ||
            previous.isLoading != current.isLoading ||
            previous.buttonEnabled != current.buttonEnabled,
        builder: (context, state) => AnimatedOpacity(
          opacity: state.numberEntering ? 1.0 : 0.0,
          duration: _animationDuration,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: BaseButton(
              text: localization.sendCode,
              isLoading: state.isLoading,
              enabled: state.buttonEnabled,
              onPressed: () {
                sendEvent(AuthorizationEvent.sendCodeClicked());
              },
            ),
          ),
        ),
      );

  Widget _buildPrivacyPolicyAndTermsOfUseButton() => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: localization.privacyPolicyAndTermsOfUseDescription,
            style: TextStyle(
              height: 18 / 13,
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColors.onBackground12,
            ),
            children: [
              TextSpan(
                text: localization.privacyPolicy,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.onBackground12,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    sendEvent(AuthorizationEvent.privacyPolicyClicked());
                  },
              ),
              TextSpan(
                text: " ${localization.and} ",
              ),
              TextSpan(
                text: localization.termsOfUse,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.onBackground12,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    sendEvent(AuthorizationEvent.termsOfUseClicked());
                  },
              ),
            ],
          ),
        ),
      );

  Widget _buildFooterSection() => BlocBuilder<AuthorizationBloc, AuthorizationState>(
        buildWhen: (previous, current) => previous.numberEntering != current.numberEntering,
        builder: (context, state) =>
            state.numberEntering ? _buildSendCodeButton() : _buildPrivacyPolicyAndTermsOfUseButton(),
      );
}
