part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    BlocAction? action,
    Locale? locale,
  }) = _AppState;
}
