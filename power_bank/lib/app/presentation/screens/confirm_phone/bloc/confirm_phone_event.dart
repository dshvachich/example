part of 'confirm_phone_bloc.dart';

@freezed
class ConfirmPhoneEvent with _$ConfirmPhoneEvent {
  factory ConfirmPhoneEvent.init() = Init;
  factory ConfirmPhoneEvent.resendCodeClicked() = ResendCodeClicked;
  factory ConfirmPhoneEvent.countOfSecondsToResendChanged(int countSecondsToResendChanged) =
      CountOfSecondsToResendChanged;
  factory ConfirmPhoneEvent.codeChanged(String code) = CodeChanged;
  factory ConfirmPhoneEvent.enterClicked() = EnterClicked;
  factory ConfirmPhoneEvent.backClicked() = BackClicked;
}
