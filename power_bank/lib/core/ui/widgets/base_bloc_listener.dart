import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_bank/app/navigation/app_navigator.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/core/bloc/base_bloc_state.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/ui/widgets/dialogs.dart';

class BaseBlocListener<B extends BlocBase<S>, S extends BaseBlocState> extends BlocListener<B, S> {
  BaseBlocListener({
    BlocListenerCondition<S>? listenWhen,
    Future<void> Function(BuildContext context, S state, BlocAction? action)? listener,
    void Function(NavigateAction action, dynamic result)? actionAfterNavigate,
    this.child,
  }) : super(
          listenWhen: (previous, current) {
            return previous.action != current.action || listenWhen?.call(previous, current) == true;
          },
          listener: getBaseListener(listener, actionAfterNavigate),
          child: child,
        );

  final Widget? child;

  static BlocWidgetListener<S> getBaseListener<S extends BaseBlocState>(
    Future<void> Function(BuildContext context, S state, BlocAction? action)? listener,
    void Function(NavigateAction action, dynamic result)? actionAfterNavigate,
  ) =>
      (BuildContext context, S state) async {
        BlocAction? action = state.action;
        await listener?.call(context, state, action);
        if (action is NavigateAction) {
          SchedulerBinding.instance?.addPostFrameCallback((_) async {
            var result = await AppNavigator.navigate(context: context, action: action);
            actionAfterNavigate?.call(action, result);
          });
        }
        if (action is ShowSnackBarMessage) {
          showSnackBarMessage(context, action);
        }
        if (action is ShowLoader) {
          // LoaderDialog.show(context: context);
        }
        if (action is HideLoader) {
          // Navigator.of(context).pop(context);
        }
        if (action is ShowAlertMessage) {
          // showMessage(context, action);
        }
      };
}
