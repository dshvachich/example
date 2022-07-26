part of 'start_bloc.dart';

@freezed
class StartState extends BaseBlocState with _$StartState {
  factory StartState({
    BlocAction? action,
  }) = _StartState;
}

class ShowErrorMessage extends BlocAction {}

class RegisterLocalization extends BlocAction {}
