part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  factory AppEvent.init() = Init;
  factory AppEvent.appLifecycleStateChanged(AppLifecycleState state) = AppLifecycleStateChanged;
}
