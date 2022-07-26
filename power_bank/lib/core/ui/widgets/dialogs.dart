import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_bank/localization/app_localizations.dart';

import '../../../app/resources/app_colors.dart';
import '../../bloc/bloc_action.dart';
import '../../enums/message_type.dart';

class Dialogs {
  static Future<void> showAlertMessage({
    required BuildContext context,
    required String message,
    required String mainButtonText,
    String? additionalButtonText,
    String? title,
    VoidCallback? onMainButtonPressed,
    VoidCallback? onAdditionalButtonPressed,
    bool dismissible = true,
  }) async {
    return showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: Text(message),
            actions: <Widget>[
              if (additionalButtonText != null)
                TextButton(
                  child: Text(additionalButtonText),
                  onPressed: () {
                    onAdditionalButtonPressed?.call();
                  },
                ),
              TextButton(
                child: Text(mainButtonText),
                onPressed: () {
                  if (onMainButtonPressed != null) {
                    onMainButtonPressed.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            backgroundColor: AppColors.surface,
            title: title != null
                ? Text(
                    title,
                    style: TextStyle(color: AppColors.onSurface1),
                  )
                : null,
            content: Text(
              message,
              style: TextStyle(color: AppColors.onSurface1),
            ),
            actions: <Widget>[
              if (additionalButtonText != null)
                TextButton(
                  child: Text(
                    additionalButtonText,
                    style: TextStyle(color: AppColors.onSurface1),
                  ),
                  onPressed: () {
                    onAdditionalButtonPressed?.call();
                  },
                ),
              TextButton(
                child: Text(
                  mainButtonText,
                  style: TextStyle(color: AppColors.onSurface1),
                ),
                onPressed: () {
                  if (onMainButtonPressed != null) {
                    onMainButtonPressed.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        }
      },
    );
  }
}

void showAlertMessage(
  BuildContext context, {
  required ShowAlertMessage action,
  VoidCallback? onMainButtonPressed,
  VoidCallback? onAdditionalButtonPressed,
}) {
  switch (action.messageType) {
    case MessageType.customMessage:
      Dialogs.showAlertMessage(
        context: context,
        title: action.title,
        message: action.message!,
        mainButtonText: action.mainButtonText ?? 'Ok',
        additionalButtonText: action.additionalButtonText,
        dismissible: action.dismissible,
        onMainButtonPressed: onMainButtonPressed,
        onAdditionalButtonPressed: onAdditionalButtonPressed,
      );
      break;
    // case MessageType.noConnection:
    //   Dialogs.showMessageDialog(
    //     context: context,
    //     title: AppLocalizations.of(context).cantGetData,
    //     message: AppLocalizations.of(context).checkYourInternetConnection,
    //     mainButtonText: action.mainButtonText ?? 'Ok',
    //     additionalButtonText: action.additionalButtonText,
    //     dismissible: action.dismissible,
    //     onMainButtonPressed: onMainButtonPressed,
    //     onAdditionalButtonPressed: onAdditionalButtonPressed,
    //   );
    //   break;
    case MessageType.noGeoPermission:
      Dialogs.showAlertMessage(
        context: context,
        title: AppLocalizations.of(context).cantGetGeoPermission,
        message: AppLocalizations.of(context).checkYourGeoSettings,
        mainButtonText: action.mainButtonText ?? 'Ok',
        additionalButtonText: action.additionalButtonText,
        dismissible: action.dismissible,
        onMainButtonPressed: onMainButtonPressed,
        onAdditionalButtonPressed: onAdditionalButtonPressed,
      );
      break;
    // case MessageType.undefinedError:
    //   Dialogs.showMessageDialog(
    //     context: context,
    //     title: AppLocalizations.of(context).error,
    //     message: AppLocalizations.of(context).somethingWentWrong,
    //     mainButtonText: action.mainButtonText ?? AppLocalizations.of(context).ok,
    //     additionalButtonText: action.additionalButtonText,
    //     dismissible: action.dismissible,
    //     onMainButtonPressed: onMainButtonPressed,
    //     onAdditionalButtonPressed: onAdditionalButtonPressed,
    //   );
    //   break;
  }
}

void showSnackBarMessage(BuildContext context, ShowSnackBarMessage action) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        action.message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.onAccent2,
        ),
      ),
      backgroundColor: AppColors.accent2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    ),
  );
}
