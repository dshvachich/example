import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/resources/app_styles.dart';
import 'package:power_bank/app/widgets/loaders/base_loader.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_listener.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/core/ui/widgets/dialogs.dart';
import 'package:power_bank/di/injection.dart';
import 'package:power_bank/gen/assets.gen.dart';

import 'bloc/start_bloc.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends BaseBlocStateWidget<StartScreen, StartBloc, StartEvent> {
  @override
  Widget build(BuildContext context) => BaseBlocListener<StartBloc, StartState>(
        listener: (context, state, action) async {
          if (action is RegisterLocalization) {
            await Locator.registerLocalization(context);
          }
          if (action is NavigateAction) {
            SystemChrome.setSystemUIOverlayStyle(AppStyles.mainStyle);
          }
          if (action is ShowErrorMessage) {
            _showMessage();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background2,
          body: Column(
            children: [
              Spacer(flex: 215),
              Center(child: _buildLogo()),
              Spacer(flex: 220),
              Center(child: _buildLoader()),
              Spacer(flex: 225),
            ],
          ),
        ),
      );

  Widget _buildLogo() => SvgPicture.asset(Assets.images.appLogo, width: 128, height: 128);

  Widget _buildLoader() => BaseLoader(size: 30, color: AppColors.onBackground2);

  void _showMessage() {
    showAlertMessage(
      context,
      action: ShowAlertMessage(
        title: localization.error,
        message: localization.noNetworkConnection,
        mainButtonText: localization.repeat,
      ),
      onMainButtonPressed: () {
        Navigator.pop(context);
        sendEvent(StartEvent.repeatClicked());
      },
    );
  }
}
