part of 'authorization_bloc.dart';

@freezed
class AuthorizationState extends BaseBlocState with _$AuthorizationState {
  factory AuthorizationState({
    BlocAction? action,
    @Default(PhoneForm.pure()) PhoneForm phone,
    @Default(false) bool numberEntering,
    @Default(false) bool isLoading,
    @Default(false) bool buttonEnabled,
  }) = _AuthorizationState;
}

class HideKeyboard extends BlocAction {}
