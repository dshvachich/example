part of 'confirm_phone_bloc.dart';

@freezed
class ConfirmPhoneState extends BaseBlocState with _$ConfirmPhoneState {
  factory ConfirmPhoneState({
    BlocAction? action,
    required PhoneNumber phone,
    @Default(false) bool isLoading,
    @Default(0) int countOfSecondsToResend,
    String? code,
    @Default(false) bool buttonEnabled,
  }) = _ConfirmPhoneState;
}
