import 'package:power_bank/localization/app_localizations.dart';

import '../failures.dart';

class BaseErrorHandler {
  static String handleError(Failure failure, AppLocalizations localization) {
    String handledError = '';
    if (failure is RequestFailure) {
      handledError = failure.error ?? '';
    } else if (failure is NetworkFailure) {
      handledError = localization.noNetworkConnection;
    } else {
      handledError = localization.somethingWentWrong;
    }
    return handledError;
  }
}
